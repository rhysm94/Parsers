//
//  Parser.swift
//  Parsers
//
//  Created by Rhys Morgan on 03/07/2020.
//

public struct Parser<A> {
	// Base function
	public let run: (inout Substring) -> A?

	public init(run: @escaping (inout Substring) -> A?) {
		self.run = run
	}

	// Convenience function
	public func run(_ string: String) -> (match: A?, rest: Substring) {
		var copy = string[...]
		let match = run(&copy)
		return (match, copy)
	}

	// callAsFunction for better call-site syntax
	public func callAsFunction(_ substring: inout Substring) -> A? {
		run(&substring)
	}

	public func callAsFunction(_ string: String) -> (match: A?, rest: Substring) {
		run(string)
	}

	public func map<B>(_ f: @escaping (A) -> B) -> Parser<B> {
		Parser<B> { str in
			self.run(&str).map(f)
		}
	}

	public func flatMap<B>(_ f: @escaping (A) -> Parser<B>) -> Parser<B> {
		Parser<B> { str in
			let original = str
			let parserB = self.run(&str).map(f)
			guard let matchB = parserB?.run(&str) else {
				str = original
				return nil
			}
			return matchB
		}
	}
}
