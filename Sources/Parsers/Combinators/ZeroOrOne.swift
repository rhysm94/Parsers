//
//  ZeroOrOne.swift
//  Parsers
//
//  Created by Rhys Morgan on 07/07/2020.
//

public func zeroOrOne<Output>(_ parser: Parser<Output>) -> Parser<Void> {
	zeroOrMore(parser).flatMap {
		$0.isEmpty || $0.count == 1 ? .always(()) : .never
	}
}
