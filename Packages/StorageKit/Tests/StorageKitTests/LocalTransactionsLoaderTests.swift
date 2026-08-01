import Foundation
import XCTest
import Combine
@testable import StorageKit

final class LocalTransactionsLoaderTests: XCTestCase {
    
    func test_load_returnsNoCache_whenStoreIsEmpty() {
        let store = TransactionsStoreSpy()
        
        let sut   = LocalTransactionsLoader(store: store )
        
        let result = sut.loadTransactions(accountID: "account123")
        
        XCTAssertEqual(result, .failure(.noCache))
    }
  
    
    func test_load_returnsExpired_whenCacheIsOlderThan24Hours() {
        let store = TransactionsStoreSpy()
        store.stubbedResult = (
            transactions: [],
            capturedAt: Date().addingTimeInterval(-25 * 3600)
        )
        
        let sut   = LocalTransactionsLoader(store: store )
        
        let result = sut.loadTransactions(accountID: "account123")
        
        XCTAssertEqual(result, .failure(.cacheExpired))
    }
    
}
