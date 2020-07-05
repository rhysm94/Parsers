//
//  ZeroOrMore.swift
//  Parsers
//
//  Created by Rhys Morgan on 05/07/2020.
//


/// Parses zero or more values from the input string
/// - Parameters:
///   - parser: Parser you wish to run zero or more times on the input string
///   - separatedBy: `Parser<Void> ` which described any separator that may exist between the values parsed by the first parser
/// - Returns: A Parser of an Array of `A`
public func zeroOrMore<A>(_ parser: Parser<A>, separatedBy s: Parser<Void> = .always(())) -> Parser<[A]> {
	Parser { str in
		var copy = str
		var matches: [A] = []
		while let value = parser(&str) {
			copy = str
			matches.append(value)
			if s(&str) == nil {
				return matches
			}
		}
		str = copy
		return matches
	}
}
