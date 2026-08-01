import Foundation
import XCTest
import Combine
import Core
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
    
    
    
    func test_load_deliversTransactions_whenCacheIsNotExpired() {
        let transaction = Transaction(
            id: "t1",
            amount: Decimal(string: "-250.00")!,
            date: Date(),
            merchant: "Carrefour"
        )
        let capturedAt = Date().addingTimeInterval(-1 * 3600)
        
        let store = TransactionsStoreSpy()
        store.stubbedResult = (
            transactions: [transaction],
            capturedAt: capturedAt
        )
        
        let sut = LocalTransactionsLoader(store: store)
        
        let result = sut.loadTransactions(accountID: "account123")
        
        XCTAssertEqual(
            result,
            .success(
                TransactionsSnapshot(
                    transactions: [transaction],
                    source: .cache,
                    capturedAt: capturedAt
                )
            )
        )
    }
    
    
    func test_save_insertsTransactionsIntoStore() {
        let transaction = Transaction(
            id: "t1",
            amount: Decimal(string: "-250.00")!,
            date: Date(),
            merchant: "Carrefour"
        )
        
        
        let store = TransactionsStoreSpy()
        let sut = LocalTransactionsLoader(store: store)
        
        sut.save([transaction], accountID: "account123" )
        
        XCTAssertEqual(store.insertedTransactions, [transaction])
        XCTAssertEqual(store.insertedAccountIDs, ["account123"])
    }
    
    
}
