//
//  AlwaysNever.swift
//  Parsers
//
//  Created by Rhys Morgan on 03/07/2020.
//

public extension Parser {
	static func always(_ value: A) -> Parser {
		Parser { _ in value }
	}

	static var never: Parser {
		Parser { _ in nil }
	}
}
