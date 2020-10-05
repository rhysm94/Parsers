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

	func testIntMaxParsing() {
		let match = Parser.int(String(Int.max))
		XCTAssertEqual(Int.max, match.match)
	}

	func testIntMaxPlusOneParsingFails() {
		let match = Parser.int("9223372036854775808")
		XCTAssertNil(match.match)
	}

	func testIntMinParsing() {
		let match = Parser.int(String(Int.min))
		XCTAssertEqual(Int.min, match.match)
	}

	func testIntMinMinusOneParsingFails() {
		let match = Parser.int("-9223372036854775809")
		XCTAssertNil(match.match)
	}

	static let allTests = [
		(testMatchOneInt, "testMatchOneInt"),
		(testMatchIntWithMore, "testMatchIntWithMore"),
		(testNoInt, "testNoInt"),
		(testNegativeIntSuccess, "testNegativeIntSuccess"),
		(testNegativeIntSuccess_LongerInput, "testNegativeIntSuccess_LongerInput"),
		(testNegativeIntFailure, "testNegativeIntFailure"),
		(testIntMaxParsing, "testIntMaxParsing"),
		(testIntMaxPlusOneParsingFails, "testIntMaxPlusOneParsingFails"),
		(testIntMinParsing, "testIntMinParsing"),
		(testIntMinMinusOneParsingFails, "testIntMinMinusOneParsingFails")
	]
}
