import Foundation
import Core
public final class LocalTransactionsLoader {
    
    private let store: TransactionsStore
    
    public init(store: TransactionsStore) {
        self.store = store
    }
    
    func loadTransactions(accountID: String) -> Result<TransactionsSnapshot, TransactionsError> {
        return .failure(.noCache)
    }
    
}
