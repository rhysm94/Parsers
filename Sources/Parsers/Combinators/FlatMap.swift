//
//  FlatMap.swift
//  Parsers
//
//  Created by Rhys Morgan on 06/07/2020.
//

public extension Parser {
	func flatMap<B>(_ f: @escaping (A) -> Parser<B>) -> Parser<B> {
		Parser<B> { str in
			let original = str
			let parserB = self.run(&str).map(f)
			guard let matchB = parserB?.run(&str) else {
				str = original
				return nil
			}
			return matchB
		}
	}
}
