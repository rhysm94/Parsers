//
//  OneOrMore.swift
//  Parsers
//
//  Created by Rhys Morgan on 06/07/2020.
//

public func oneOrMore<A>(_ parser: Parser<A>, separatedBy s: Parser<Void> = .always(())) -> Parser<[A]> {
	Parser { str in
		guard let result = zeroOrMore(parser, separatedBy: s).run(&str), !result.isEmpty else {
			return nil
		}

		return result
	}
}
