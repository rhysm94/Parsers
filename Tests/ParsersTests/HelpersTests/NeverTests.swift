//
//  NeverTests.swift
//  ParsersTests
//
//  Created by Rhys Morgan on 03/07/2020.
//

import Parsers
import XCTest

final class NeverTests: XCTestCase {
	func testNever() {
		let match = Parser<Double>.never("12345")
		XCTAssertNil(match.match)
		XCTAssertEqual("12345", match.rest)
	}

	static let allTests = [
		(testNever, "testNever")
	]
}
