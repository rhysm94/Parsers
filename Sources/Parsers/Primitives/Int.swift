//
//  Int.swift
//  Parsers
//
//  Created by Rhys Morgan on 03/07/2020.
//

public extension Parser where Output == Int {
	static let int = Parser { input in
		let original = input
		
		var isFirstCharacter = true
		let intPrefix = input.prefix { character in
			defer { isFirstCharacter = false }
			return (character == "-" || character == "+") && isFirstCharacter || character.isNumber
		}
		
		guard let match = Int(intPrefix) else {
			input = original
			return nil
		}
		
		input.removeFirst(intPrefix.count)
		return match
	}
}
