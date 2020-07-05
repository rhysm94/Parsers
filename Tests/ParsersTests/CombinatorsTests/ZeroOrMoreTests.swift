//
//  ZeroOrMoreTests.swift
//  ParsersTests
//
//  Created by Rhys Morgan on 05/07/2020.
//

import Parsers
import XCTest

final class ZeroOrMoreTests: XCTestCase {
	let zeroOrMoreSpaces = zeroOrMore(.literal(" "))

	private func testHelloWorld(prefixedSpaces: Int = 0) throws {
		let input = String(repeating: " ", count: prefixedSpaces) + "Hello World"

		let result = zeroOrMoreSpaces(input)
		let match: [Void] = try XCTUnwrap(result.match)
		XCTAssertEqual(prefixedSpaces, match.count)
		XCTAssertEqual("Hello World", result.rest)
	}

	func testZeroOrMoreSpaces_Zero() throws {
		try testHelloWorld()
	}

	func testZeroOrMoreSpaces_One() throws {
		try testHelloWorld(prefixedSpaces: 1)
	}

	func testZeroOrMoreSpaces_Many() throws {
		try testHelloWorld(prefixedSpaces: 30)
	}
}
