//
//  Literal.swift
//  Parsers
//
//  Created by Rhys Morgan on 03/07/2020.
//

public extension Parser where Output == Void {
	static func literal(_ string: String) -> Parser {
		Parser { str in
			guard str.hasPrefix(string) else { return nil }
			str.removeFirst(string.count)
			return ()
		}
	}
}
