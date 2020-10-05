//
//  Map.swift
//  Parsers
//
//  Created by Rhys Morgan on 06/07/2020.
//

public extension Parser {
	func map<NewOutput>(_ f: @escaping (Output) -> NewOutput) -> Parser<NewOutput> {
		Parser<NewOutput> { str in
			self.run(&str).map(f)
		}
	}
}
