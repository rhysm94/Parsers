//
//  AlwaysTests.swift
//  ParserTests
//
//  Created by Rhys Morgan on 03/07/2020.
//

import Parsers
import XCTest

final class AlwaysTests: XCTestCase {
	func testAlways_NoInput() {
		let match = Parser.always("Hello")("")
		XCTAssertEqual("Hello", match.match)
		XCTAssertEqual("", match.rest)
	}

	func testAlways_SameInput() {
		let match = Parser.always("Hello")("Hello")
		XCTAssertEqual("Hello", match.match)
		XCTAssertEqual("Hello", match.rest)
	}

	static let allTests = [
		(testAlways_NoInput, "testAlways_NoInput"),
		(testAlways_SameInput, "testAlways_SameInput")
	]
}
