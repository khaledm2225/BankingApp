import Foundation
import XCTest
import Combine
import Core
@testable import StorageKit

final class TransactionsStoreSpy: TransactionsStore {

    var stubbedResult: (transactions: [Transaction], capturedAt: Date)?

    func fetch(accountID: String) -> (transactions: [Transaction], capturedAt: Date)? {
        stubbedResult
    }

    func insert(_ transactions: [Transaction], accountID: String, capturedAt: Date) {
    }

    func delete(accountID: String) {
    }
}



final class LocalTransactionsLoaderTests: XCTestCase {
    
    func test_load_returnsNoCache_whenStoreIsEmpty() {
        let store = TransactionsStoreSpy()
        
        let sut   = LocalTransactionsLoader(store: store )
        
        let result = sut.loadTransactions(accountID: "account123")
        
        XCTAssertEqual(result, .failure(.noCache))
    }
  
    
    
}
