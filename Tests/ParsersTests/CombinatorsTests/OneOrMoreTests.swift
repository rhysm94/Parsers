//
//  OneOrMoreTests.swift
//  ParsersTests
//
//  Created by Rhys Morgan on 06/07/2020.
//

import Parsers
import XCTest

final class OneOrMoreTests: XCTestCase {
	let oneOrMoreInt = oneOrMore(.int, separatedBy: .literal(","))

	func testSimpleInt() {
		let input = "1,2,3,4"

		let result = oneOrMoreInt(input)

		XCTAssertEqual([1,2,3,4], result.match)
		XCTAssertTrue(result.rest.isEmpty)
	}

	func testTrailingComma() {
		let input = "1,2,3,4,"
		let result = oneOrMoreInt(input)

		XCTAssertEqual([1,2,3,4], result.match)
		XCTAssertEqual(",", result.rest)
	}

	func testExactlyOneInt() {
		let result = oneOrMoreInt("1")
		XCTAssertEqual([1], result.match)
		XCTAssertTrue(result.rest.isEmpty)
	}

	func testZeroInts() {
		let result = oneOrMoreInt("abcde")
		XCTAssertNil(result.match)
		XCTAssertEqual("abcde", result.rest)
	}
}
