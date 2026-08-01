import Foundation
import Core
@testable import StorageKit

final class TransactionsStoreSpy: TransactionsStore {

    var stubbedResult: (transactions: [Transaction], capturedAt: Date)?
    private(set) var insertedTransactions: [Transaction] = []
    private(set) var insertedAccountIDs: [String] = []


    func fetch(accountID: String) -> (transactions: [Transaction], capturedAt: Date)? {
        stubbedResult
    }
    
    func insert(_ transactions: [Transaction], accountID: String, capturedAt: Date) {
        insertedTransactions.append(contentsOf: transactions)
        insertedAccountIDs.append(accountID)
    }
    
    func delete(accountID: String) {
        
        
    }
}
