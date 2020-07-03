//
//  ParserTests.swift
//  ParsersTests
//
//  Created by Rhys Morgan on 03/07/2020.
//

import XCTest
import Parsers

final class ParserTests: XCTestCase {
	func testParser() {
		let neverParser = Parser<Void> { _ in nil }
		let match: Void? = neverParser("").match
		XCTAssertNil(match)
	}

	static var allTests = [
		("testParser", testParser)
	]
}
