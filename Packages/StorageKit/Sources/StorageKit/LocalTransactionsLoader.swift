import Foundation
import Core
public final class LocalTransactionsLoader {
    
    private let store: TransactionsStore
    
    public init(store: TransactionsStore) {
        self.store = store
    }
    
    func loadTransactions(accountID: String) -> Result<TransactionsSnapshot, TransactionsError> {
        
        guard let cached = store.fetch(accountID: accountID) else {
            return .failure(.noCache)
        }
        
        let age = Date().timeIntervalSince(cached.capturedAt)
        
        guard age < 24 * 3600 else {
            return .failure(.cacheExpired)
        }
        
        return .failure(.noCache)
    }
    
    
    
}
