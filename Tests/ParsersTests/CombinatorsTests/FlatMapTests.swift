//
//  FlatMapTests.swift
//  ParsersTests
//
//  Created by Rhys Morgan on 04/07/2020.
//

import Parsers
import XCTest

final class FlatMapTests: XCTestCase {
	func testFlatMapEvenInts_Success() throws {
		let evenNumberParser = Parser.int.flatMap { int in
			int.isMultiple(of: 2) ? .always(int) : .never
		}

		let match = evenNumberParser("12")
		let unwrapped = try XCTUnwrap(match.match)
		XCTAssertEqual(12, unwrapped)
		XCTAssertEqual("", match.rest)
	}

	func testFlatMapEvenInts_Failure() throws {
		let evenNumberParser = Parser.int.flatMap { int in
			int.isMultiple(of: 2) ? .always(int) : .never
		}

		let match = evenNumberParser("13")
		XCTAssertNil(match.match)
		XCTAssertEqual("13", match.rest)
	}

	static let allTests = [
		("testFlatMapEvenInts_Success", testFlatMapEvenInts_Success),
		("testFlatMapEvenInts_Failure", testFlatMapEvenInts_Failure)
	]
}
