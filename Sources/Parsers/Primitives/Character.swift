//
//  Character.swift
//  Parsers
//
//  Created by Rhys Morgan on 03/07/2020.
//

public extension Parser where Output == Character {
	static let char = Parser { str in
		guard !str.isEmpty else { return nil }
		return str.removeFirst()
	}
}
