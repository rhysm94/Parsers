//
//  PrefixTests.swift
//  ParsersTests
//
//  Created by Rhys Morgan on 04/07/2020.
//

import Parsers
import XCTest

final class PrefixTests: XCTestCase {
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
}
