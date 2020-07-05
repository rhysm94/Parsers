//
//  LiteralTests.swift
//  ParsersTests
//
//  Created by Rhys Morgan on 03/07/2020.
//

import Parsers
import XCTest

final class LiteralTests: XCTestCase {
	func testExpectedMatch() {
		let leftBraceParser = Parser.literal("{")
		let match = leftBraceParser("{ ")
		XCTAssertNotNil(match.match)
		XCTAssertEqual(" ", match.rest)
	}

	func testExpectedNoMatch() {
		let leftBraceParser = Parser.literal("{")
		let match = leftBraceParser("} ")
		XCTAssertNil(match.match)
		XCTAssertEqual("} ", match.rest)
	}

	func testExpectedMatchLongLiteral() {
		let helloWorldParser = Parser.literal("Hello World")
		let match = helloWorldParser("Hello World, how are you?")
		XCTAssertNotNil(match.match)
		XCTAssertEqual(", how are you?", match.rest)
	}

	static let allTests = [
		(testExpectedMatch, "testExpectedMatch"),
		(testExpectedNoMatch, "testExpectedNoMatch"),
		(testExpectedMatchLongLiteral, "testExpectedMatchLongLiteral")
	]
}
