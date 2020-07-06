//
//  Map.swift
//  Parsers
//
//  Created by Rhys Morgan on 06/07/2020.
//

public extension Parser {
	func map<B>(_ f: @escaping (A) -> B) -> Parser<B> {
		Parser<B> { str in
			self.run(&str).map(f)
		}
	}
}
