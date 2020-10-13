//
//  Literal.swift
//  Parsers
//
//  Created by Rhys Morgan on 03/07/2020.
//

public extension Parser where Output == Void {
	static func prefix(_ string: String) -> Parser {
		Parser { input in
			guard input.hasPrefix(string) else { return nil }
			input.removeFirst(string.count)
			return ()
		}
	}
}
