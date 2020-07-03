//
//  IntTests.swift
//  ParsersTests
//
//  Created by Rhys Morgan on 03/07/2020.
//

import Parsers
import XCTest

final class IntTests: XCTestCase {
	func testMatchOneInt() {
		let match = Parser.int("1")
		XCTAssertEqual(1, match.match)
	}

	func testMatchIntWithMore() {
		let match = Parser.int("1 2")
		XCTAssertEqual(1, match.match)
		XCTAssertEqual(" 2", match.rest)
	}

	func testNoInt() {
		let match = Parser.int("foo")
		XCTAssertNil(match.match)
		XCTAssertEqual("foo", match.rest)
	}

	func testNegativeIntSuccess() {
		let match = Parser.int("-10")
		XCTAssertEqual(-10, match.match)
	}

	func testNegativeIntSuccess_LongerInput() {
		let match = Parser.int("-10 hello world")
		XCTAssertEqual(-10, match.match)
		XCTAssertEqual(" hello world", match.rest)
	}

	func testNegativeIntFailure() {
		let match = Parser.int("-10-10-10")
		XCTAssertNil(match.match)
	}
}
