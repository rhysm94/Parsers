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
}
