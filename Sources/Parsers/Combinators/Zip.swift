//
//  Zip.swift
//  Parsers
//
//  Created by Rhys Morgan on 05/07/2020.
//

public func zip<A, B>(_ a: Parser<A>, _ b: Parser<B>) -> Parser<(A, B)> {
	Parser { str in
		let original = str

		guard let maybeA = a.run(&str) else {
			return nil
		}

		guard let result = b.run(&str) else {
			str = original
			return nil
		}

		return (maybeA, result)
	}
}

public func zip<A, B, C>(_ a: Parser<A>, _ b: Parser<B>, _ c: Parser<C>) -> Parser<(A, B, C)> {
	zip(a, zip(b, c)).map { a, bc in (a, bc.0, bc.1) }
}
