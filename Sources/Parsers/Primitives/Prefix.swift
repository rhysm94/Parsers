//
//  Literal.swift
//  Parsers
//
//  Created by Rhys Morgan on 03/07/2020.
//

public extension Parser where Output == Void {
	static func prefix(_ string: String) -> Parser {
		Parser { input in
			guard input.hasPrefix(string) else { return nil }
			input.removeFirst(string.count)
			return ()
		}
	}
}

extension Parser: ExpressibleByUnicodeScalarLiteral where Output == Void {
	public typealias UnicodeScalarLiteralType = StringLiteralType
}

extension Parser: ExpressibleByExtendedGraphemeClusterLiteral where Output == Void {
	public typealias ExtendedGraphemeClusterLiteralType = StringLiteralType
}

extension Parser: ExpressibleByStringLiteral where Output == Void {
	public init(stringLiteral value: String) {
		self = .prefix(value)
	}
}
