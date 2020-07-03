//
//  Int.swift
//  Parsers
//
//  Created by Rhys Morgan on 03/07/2020.
//

public extension Parser where A == Int {
	static let int = Parser { str in
		let prefix = str.prefix(while: { $0 == "-" || $0.isNumber })
		guard let int = Int(prefix) else {
			return nil
		}
		str.removeFirst(prefix.count)
		return int
	}
}
