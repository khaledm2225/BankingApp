import Foundation

public enum DataSource: Equatable {
    case remote
    case cache
}

public struct TransactionsSnapshot: Equatable {
    public let transactions: [Transaction]
    public let source: DataSource
    public let capturedAt: Date

    public init(
        transactions: [Transaction],
        source: DataSource,
        capturedAt: Date
    ) {
        self.transactions = transactions
        self.source = source
        self.capturedAt = capturedAt
    }
}
