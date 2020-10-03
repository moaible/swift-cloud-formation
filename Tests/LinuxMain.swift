import XCTest

import CloudFormationTests

var tests = [XCTestCaseEntry]()
tests += CloudFormationTests.allTests()
XCTMain(tests)
