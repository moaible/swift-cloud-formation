import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(swift_cli_boilerplateTests.allTests),
    ]
}
#endif
