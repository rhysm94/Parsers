//
//  PrefixWhileTests.swift
//  ParsersTests
//
//  Created by Rhys Morgan on 04/07/2020.
//

import Parsers
import XCTest

final class PrefixWhileTests: XCTestCase {
	let nextWord = Parser.prefix { $0.isLetter }

	func testGetsNextWord() {
		let match = nextWord("Hello World!")
		XCTAssertEqual("Hello", match.match)
		XCTAssertEqual(" World!", match.rest)
	}

	func testMatchEmptyWhenNoMatchFound() {
		let match = nextWord(" Hello World!")
		XCTAssertEqual("", match.match)
		XCTAssertEqual(" Hello World!", match.rest)
	}

	func testPrefixUpto_Success() {
		let text = "---Hello World---"

		let parsed = Parser.prefix(upTo: "Hello").run(text)

		XCTAssertEqual("---", parsed.match)
		XCTAssertEqual("Hello World---", parsed.rest)
	}

	func testPrefixUpto_NotFound() {
		let text = "---Hello World---"

		let parsed = Parser.prefix(upTo: "Howdy").run(text)
		XCTAssertNil(parsed.match)
		XCTAssertEqual(text, String(parsed.rest))
	}

	func testPrefixThrough_Success() {
		let text = """
		func parse(_ string: inout String) {}
		"""

		let parsed = Parser.prefix(through: "inout").run(text)
		XCTAssertEqual("func parse(_ string: inout", parsed.match)
		XCTAssertEqual(" String) {}", parsed.rest)
	}

	func testPrefixThrough_NotFound() {
		let text = """
		func parse(_ string: inout String) {}
		"""

		let parsed = Parser.prefix(through: "Int").run(text)
		XCTAssertNil(parsed.match)
		XCTAssertEqual(text, String(parsed.rest))
	}

	static let allTests = [
		(testGetsNextWord, "testGetsNextWord"),
		(testMatchEmptyWhenNoMatchFound, "testMatchEmptyWhenNoMatchFound")
	]
}
