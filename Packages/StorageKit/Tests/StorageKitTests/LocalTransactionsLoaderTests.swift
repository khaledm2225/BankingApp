import Foundation
import XCTest
import Combine

@testable import StorageKit
final class LocalTransactionsLoaderTests: XCTestCase {
    
    func test_load_returnsNoCache_whenStoreIsEmpty() {
        let store = TransactionsStoreSpy()
    
        let sut   = LocalTransactionLoader(store: store )
        
        let result = sut.loadTransactions(accountID: "account123")
       
        XCTAssertEqual(result, .failure(.noCache))
    }
    
    func test_load_returnsExpierd_whenStoreRecordsAreOutDated() {
        
    }
    
    
    func test_load_deleteExpiredRecords_whenStoreRecordsAreOutDated() {
        
    }
    
    func test_load_recordsFromStore_whenRecordsAreNotOutDated() {
        
    }
    
    
    
}
