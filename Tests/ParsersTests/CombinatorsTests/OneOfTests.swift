//
//  OneOfTests.swift
//  ParsersTests
//
//  Created by Rhys Morgan on 07/07/2020.
//

import Parsers
import XCTest

final class OneOfTests: XCTestCase {
	enum Currency {
		case gbp, usd, eur
	}

	private let currencyParser = oneOf([
		Parser.literal("£").flatMap { .always(Currency.gbp) },
		Parser.literal("$").flatMap { .always(.usd) },
		Parser.literal("€").flatMap { .always(.eur) }
	])

	private let vowelParser = oneOf(
		Parser.literal("a").flatMap { .always("a") },
		Parser.literal("e").flatMap { .always("e") },
		Parser.literal("i").flatMap { .always("i") },
		Parser.literal("o").flatMap { .always("o") },
		Parser.literal("u").flatMap { .always("u") }
	)

	func testOneOfContains_Array() {
		let inputString = "£"
		let match = currencyParser(inputString)
		XCTAssertEqual(.gbp, match.match)
		XCTAssertTrue(match.rest.isEmpty)
	}

	func testOneOfDoesntContain_Array() {
		let inputString = "Hello"
		let match = currencyParser(inputString)
		XCTAssertNil(match.match)
		XCTAssertEqual("Hello", match.rest)
	}

	func testOneOfContains_Variadic() {
		let inputString = "abcde"
		let match = vowelParser(inputString)
		XCTAssertEqual("a", match.match)
		XCTAssertEqual("bcde", match.rest)
	}

	func testOneOfDoesntContain_Variadic() {
		let inputString = "12345"
		let match = vowelParser(inputString)
		XCTAssertNil(match.match)
		XCTAssertEqual("12345", match.rest)
	}

	static let allTests = [
		("testOneOfContains_Array", testOneOfContains_Array),
		("testOneOfDoesntContain_Array", testOneOfDoesntContain_Array),
		("testOneOfContains_Variadic", testOneOfContains_Variadic),
		("testOneOfDoesntContain_Variadic", testOneOfDoesntContain_Variadic),
	]
}
