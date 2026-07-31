import Foundation

public enum AuthError: Error, Equatable {
    case invalidCredentials
    case accountLocked
    case offline
    case server
}

public enum AccountsError: Error, Equatable {
    case unauthorized
    case offline
    case server
}

public enum TransactionsError: Error, Equatable {
    case unauthorized
    case offline
    case server
    case cacheExpired
    case noCache
}
