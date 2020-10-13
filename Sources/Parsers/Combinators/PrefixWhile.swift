//
//  Prefix.swift
//  Parsers
//
//  Created by Rhys Morgan on 04/07/2020.
//

public extension Parser where Output == Substring {
	static func prefix(while predicate: @escaping (Character) -> Bool) -> Parser {
		Parser { str in
			let prefix = str.prefix(while: predicate)
			str.removeFirst(prefix.count)
			return prefix
		}
	}
}
