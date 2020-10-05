//
//  OneOrMore.swift
//  Parsers
//
//  Created by Rhys Morgan on 06/07/2020.
//

public func oneOrMore<Output>(
	_ parser: Parser<Output>,
	separatedBy s: Parser<Void> = .always(())
) -> Parser<[Output]> {
	zeroOrMore(parser, separatedBy: s)
		.flatMap { !$0.isEmpty ? .always($0) : .never }
}
