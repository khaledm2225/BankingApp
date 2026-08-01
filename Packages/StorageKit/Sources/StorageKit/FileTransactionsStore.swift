import Foundation
import Core

public final class FileTransactionsStore: TransactionsStore {

    private struct Cache: Codable {
        let transactions: [CachedTransaction]
        let capturedAt: Date
    }

    private struct CachedTransaction: Codable {
        let id: String
        let amount: Decimal
        let date: Date
        let merchant: String
    }

    private let directory: URL

    public init(directory: URL) {
        self.directory = directory
    }

    public func fetch(accountID: String) -> (transactions: [Transaction], capturedAt: Date)? {
        guard
            let data = try? Data(contentsOf: fileURL(for: accountID)),
            let cache = try? JSONDecoder().decode(Cache.self, from: data)
        else { return nil }

        let transactions = cache.transactions.map {
            Transaction(
                id: $0.id,
                amount: $0.amount,
                date: $0.date,
                merchant: $0.merchant
            )
        }

        return (transactions, cache.capturedAt)
    }

    public func insert(_ transactions: [Transaction], accountID: String, capturedAt: Date) {
        let cache = Cache(
            transactions: transactions.map {
                CachedTransaction(
                    id: $0.id,
                    amount: $0.amount,
                    date: $0.date,
                    merchant: $0.merchant
                )
            },
            capturedAt: capturedAt
        )

        guard let data = try? JSONEncoder().encode(cache) else { return }
        try? data.write(to: fileURL(for: accountID))
    }

    public func delete(accountID: String) {
        try? FileManager.default.removeItem(at: fileURL(for: accountID))
    }

    private func fileURL(for accountID: String) -> URL {
        directory.appendingPathComponent("transactions-\(accountID).json")
    }
}
