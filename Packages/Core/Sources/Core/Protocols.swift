import Foundation
import Combine

public protocol Authenticating {
    func login(email: String, password: String)
        -> AnyPublisher<AuthToken, AuthError>
}

public protocol TokenStoring {
    func save(_ token: AuthToken) throws
    func load() throws -> AuthToken?
    func clear() throws
}

public protocol AccountsLoader {
    func loadAccounts() -> AnyPublisher<[Account], AccountsError>
}

public protocol TransactionsLoader {
    func loadTransactions(accountID: String)
        -> AnyPublisher<TransactionsSnapshot, TransactionsError>
}
