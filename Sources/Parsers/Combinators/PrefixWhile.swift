//
//  Prefix.swift
//  Parsers
//
//  Created by Rhys Morgan on 04/07/2020.
//

import Foundation

public extension Parser where Output == Substring {
	static func prefix(while predicate: @escaping (Character) -> Bool) -> Parser {
		Parser { str in
			let prefix = str.prefix(while: predicate)
			str.removeFirst(prefix.count)
			return prefix
		}
	}

	static func prefix(upTo substring: Substring) -> Parser {
		Parser { input in
			guard let endIndex = input.range(of: substring)?.lowerBound else {
				return nil
			}

			let match = input[..<endIndex]
			input = input[endIndex...]
			return match
		}
	}

	static func prefix(through substring: Substring) -> Parser {
		Parser { input in
			guard let endIndex = input.range(of: substring)?.upperBound else {
				return nil
			}

			let match = input[..<endIndex]
			input = input[endIndex...]
			return match
		}
	}
}
