//
//  ZeroOrOneTests.swift
//  ParsersTests
//
//  Created by Rhys Morgan on 07/07/2020.
//

import Parsers
import XCTest

final class ZeroOrOneTests: XCTestCase {
	private let hyphenParser = zeroOrOne(.prefix("-"))

	func testZeroCase() {
		let result = hyphenParser.run("125")
		XCTAssertNotNil(result.match)
		XCTAssertEqual("125", result.rest)
	}

	func testOneCase() {
		let result = hyphenParser.run("-125")
		XCTAssertNotNil(result.match)
		XCTAssertEqual("125", result.rest)
	}

	func testMoreCase() {
		let result = hyphenParser.run("---abc")
		XCTAssertNil(result.match)
		XCTAssertEqual("---abc", result.rest)
	}
}
