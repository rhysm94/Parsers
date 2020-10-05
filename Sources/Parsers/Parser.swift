//
//  Parser.swift
//  Parsers
//
//  Created by Rhys Morgan on 03/07/2020.
//

public struct Parser<Output> {
	// Base function
	public let run: (inout Substring) -> Output?

	public init(run: @escaping (inout Substring) -> Output?) {
		self.run = run
	}

	// Convenience function
	public func run(_ string: String) -> (match: Output?, rest: Substring) {
		var copy = string[...]
		let match = run(&copy)
		return (match, copy)
	}

	// callAsFunction for better call-site syntax
	public func callAsFunction(_ substring: inout Substring) -> Output? {
		run(&substring)
	}

	public func callAsFunction(_ string: String) -> (match: Output?, rest: Substring) {
		run(string)
	}
}
