import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(swal_rawhtmlTests.allTests),
    ]
}
#endif
