//
//  ZipTests.swift
//  ParsersTests
//
//  Created by Rhys Morgan on 05/07/2020.
//

import Parsers
import XCTest

final class ZipTests: XCTestCase {
	func testZipCharInt() throws {
		let parser = zip(.literal("@"), .int)
		let testString = "@1234567890"

		let result = parser(testString)

		let match = try XCTUnwrap(result.match)

		XCTAssert(() == match.0)
		XCTAssertEqual(1234567890, match.1)
		XCTAssertEqual("", result.rest)
	}

	func testZipThree() throws {
		let parser = zip(.int, .literal(" "), .int)
			.map { one, _, two in (one, two) }

		let result = parser("20 40")

		let match = try XCTUnwrap(result.match)
		XCTAssertEqual(20, match.0)
		XCTAssertEqual(40, match.1)
		XCTAssertTrue(result.rest.isEmpty)
	}

	func testZipAFails() {
		let parser = zip(.literal("Hello"), .literal(" World"))
		var input = "Howdy World"[...]

		let result = parser(&input)

		XCTAssertNil(result)
		XCTAssertEqual("Howdy World", input)
	}

	func testZipBFails() {
		let parser = zip(.literal("Hello"), .literal("World"))

		// Should fail because of the space
		var input = "Hello World"[...]

		let result = parser(&input)

		XCTAssertNil(result)
		XCTAssertEqual("Hello World", input)
	}
}
