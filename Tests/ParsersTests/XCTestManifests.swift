import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
		testCase(CharacterTests.allTests),
		testCase(IntTests.allTests),
		testCase(LiteralTests.allTests),
		testCase(ParserTests.allTests),
		testCase(PrefixTests.allTests),
		testCase(AlwaysTests.allTests),
		testCase(NeverTests.allTests)
    ]
}
#endif
