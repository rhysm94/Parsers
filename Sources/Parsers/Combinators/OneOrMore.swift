//
//  OneOrMore.swift
//  Parsers
//
//  Created by Rhys Morgan on 06/07/2020.
//

public func oneOrMore<A>(_ parser: Parser<A>, separatedBy s: Parser<Void> = .always(())) -> Parser<[A]> {
	zeroOrMore(parser, separatedBy: s)
		.flatMap { !$0.isEmpty ? .always($0) : .never }
}
