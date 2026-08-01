import Foundation
import XCTest
import Core
@testable import StorageKit

final class FileTransactionsStoreTests: XCTestCase {

    private var testDirectory: URL {
        FileManager.default.temporaryDirectory
            .appendingPathComponent("FileTransactionsStoreTests")
    }

    override func setUp() {
        super.setUp()
        try? FileManager.default.createDirectory(
            at: testDirectory,
            withIntermediateDirectories: true
        )
    }

    override func tearDown() {
        try? FileManager.default.removeItem(at: testDirectory)
        super.tearDown()
    }

    func test_fetch_deliversNil_whenNothingWasSaved() {
        let sut = FileTransactionsStore(directory: testDirectory)

        let result = sut.fetch(accountID: "account123")

        XCTAssertNil(result)
    }
}
