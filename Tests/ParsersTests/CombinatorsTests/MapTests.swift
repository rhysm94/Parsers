//
//  MapTests.swift
//  ParsersTests
//
//  Created by Rhys Morgan on 10/07/2020.
//

import Parsers
import XCTest

final class MapTests: XCTestCase {
	func testMapIntToBool_True() throws {
		let evenNumberParser = Parser.int.map { $0.isMultiple(of: 2) }
		let match = evenNumberParser("12")
		let unwrapped = try XCTUnwrap(match.match)
		XCTAssertTrue(unwrapped)
		XCTAssertEqual("", match.rest)
	}
	
	func testMapIntToBool_False() throws {
		let evenNumberParser = Parser.int.map { $0.isMultiple(of: 2) }
		let match = evenNumberParser("13")
		let unwrapped = try XCTUnwrap(match.match)
		XCTAssertFalse(unwrapped)
		XCTAssertEqual("", match.rest)
	}
	
	static let allTests = [
		("testMapIntToBool_True", testMapIntToBool_True),
		("testMapIntToBool_False", testMapIntToBool_False),
	]
}
