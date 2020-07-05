//
//  CharacterTests.swift
//  ParsersTests
//
//  Created by Rhys Morgan on 03/07/2020.
//

import Parsers
import XCTest

final class CharacterTests: XCTestCase {
	func testSingleCharacter() {
		let parser = Parser.char("@")
		XCTAssertNotNil(parser.match)
		XCTAssertEqual("", parser.rest)
	}

	func testNothingParsed() {
		let parser = Parser.char("")
		XCTAssertNil(parser.match)
		XCTAssertEqual("", parser.rest)
	}

	static let allTests = [
		("testSingleCharacter", testSingleCharacter),
		("testNothingParsed", testNothingParsed)
	]
}
