import Foundation
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
