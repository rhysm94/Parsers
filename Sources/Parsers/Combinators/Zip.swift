//
//  Zip.swift
//  Parsers
//
//  Created by Rhys Morgan on 05/07/2020.
//

public func zip<A, B>(
	_ a: Parser<A>,
	_ b: Parser<B>
) -> Parser<(A, B)> {
	Parser { input in
		let original = input
		guard let maybeA = a.run(&input) else { return nil }
		guard let result = b.run(&input) else {
			input = original
			return nil
		}

		return (maybeA, result)
	}
}

public func zip<A, B, C>(
	_ a: Parser<A>,
	_ b: Parser<B>,
	_ c: Parser<C>
) -> Parser<(A, B, C)> {
	zip(a, zip(b, c))
		.map { a, bc in (a, bc.0, bc.1) }
}

public func zip<A, B, C, D>(
	_ a: Parser<A>,
	_ b: Parser<B>,
	_ c: Parser<C>,
	_ d: Parser<D>
) -> Parser<(A, B, C, D)> {
	zip(a, zip(b, c, d))
		.map { a, bcd in (a, bcd.0, bcd.1, bcd.2) }
}

public func zip<A, B, C, D, E>(
	_ a: Parser<A>,
	_ b: Parser<B>,
	_ c: Parser<C>,
	_ d: Parser<D>,
	_ e: Parser<E>
) -> Parser<(A, B, C, D, E)> {
	zip(a, zip(b, c, d, e))
		.map { a, bcde in (a, bcde.0, bcde.1, bcde.2, bcde.3) }
}
