import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
		// Literals
		testCase(CharacterTests.allTests),
		testCase(IntTests.allTests),
		testCase(LiteralTests.allTests),

		// Combinators
		testCase(FlatMapTests.allTests),
		testCase(MapTests.allTests),
		testCase(OneOfTests.allTests),
		testCase(OneOrMoreTests.allTests),
		testCase(PrefixTests.allTests),
		testCase(ZeroOrMoreTests.allTests),
		testCase(ZeroOrOneTests.allTests),
		testCase(ZipTests.allTests),

		// Helpers
		testCase(AlwaysTests.allTests),
		testCase(NeverTests.allTests),
    ]
}
#endif
