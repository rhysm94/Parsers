//
//  ZeroOrMoreTests.swift
//  ParsersTests
//
//  Created by Rhys Morgan on 05/07/2020.
//

import Parsers
import XCTest

final class ZeroOrMoreTests: XCTestCase {
	let zeroOrMoreSpaces = zeroOrMore(" ")
	let commaSeparatedInts = zeroOrMore(.int, separatedBy: ",")
	let commaOrNewLineSeparatedInts = zeroOrMore(.int, separatedBy: Parser.char.flatMap {
		$0 == "," || $0 == "\n" ? .always(()) : .never
	})

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

	func testZeroOrMore_CSV_0Values_NoTrailing() throws {
		let input = "abcde"

		let result = commaSeparatedInts(input)
		let match = try XCTUnwrap(result.match)

		XCTAssertTrue(match.isEmpty)
		XCTAssertEqual("abcde", result.rest)
	}

	func testZeroOrMore_CSV_4Values_NoTrailing() throws {
		let input = "1,2,3,4 Hello World"

		let result = commaSeparatedInts(input)
		let match = try XCTUnwrap(result.match)

		XCTAssertEqual([1,2,3,4], match)
		XCTAssertEqual(" Hello World", result.rest)
	}

	func testZeroOrMore_CSV_4Values_Trailing() throws {
		let input = "1,2,3,4,"

		let result = commaSeparatedInts(input)
		let match = try XCTUnwrap(result.match)

		XCTAssertEqual([1,2,3,4], match)
		XCTAssertEqual(",", result.rest)
	}

	func testZeroOrMore_CSV_10Values_NoTrailing_NoRest() throws {
		let input = "1,2,3,4,5,6,7,8,9,0"

		let result = commaSeparatedInts(input)
		let match = try XCTUnwrap(result.match)

		XCTAssertEqual([1,2,3,4,5,6,7,8,9,0], match)
		XCTAssertTrue(result.rest.isEmpty)
	}

	func testLongZeroOrMoreCSV() throws {
		let longInput = """
		1,2,3,4,5
		6,7,8,9,10
		11,12,13,14,15
		16,17,18,19,20
		"""

		let result = commaOrNewLineSeparatedInts(longInput)
		let match = try XCTUnwrap(result.match)

		XCTAssertEqual(Array(1...20), match)
		XCTAssertTrue(result.rest.isEmpty)
	}

	static let allTests = [
		(testZeroOrMoreSpaces_Zero, "testZeroOrMoreSpaces_Zero"),
		(testZeroOrMoreSpaces_One, "testZeroOrMoreSpaces_One"),
		(testZeroOrMoreSpaces_Many, "testZeroOrMoreSpaces_Many"),
		(testZeroOrMore_CSV_0Values_NoTrailing, "testZeroOrMore_CSV_0Values_NoTrailing"),
		(testZeroOrMore_CSV_4Values_NoTrailing, "testZeroOrMore_CSV_4Values_NoTrailing"),
		(testZeroOrMore_CSV_4Values_Trailing, "testZeroOrMore_CSV_4Values_Trailing"),
		(testZeroOrMore_CSV_10Values_NoTrailing_NoRest, "testZeroOrMore_CSV_10Values_NoTrailing_NoRest"),
		(testLongZeroOrMoreCSV, "testLongZeroOrMoreCSV")
	]
}
