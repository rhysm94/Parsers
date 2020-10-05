//
//  OneOf.swift
//  Parsers
//
//  Created by Rhys Morgan on 07/07/2020.
//

public func oneOf<Output>(_ parsers: [Parser<Output>]) -> Parser<Output> {
	Parser { str in
		for parser in parsers {
			if let match = parser(&str) {
				return match
			}
		}
		return nil
	}
}

public func oneOf<A>(_ parsers: Parser<A>...) -> Parser<A> {
	oneOf(parsers)
}
