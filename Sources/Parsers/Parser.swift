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
}
