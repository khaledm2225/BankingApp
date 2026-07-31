import Foundation

public struct Transaction: Identifiable, Equatable {
    public let id: String
    public let amount: Decimal
    public let date: Date
    public let merchant: String

    public init(
        id: String,
        amount: Decimal,
        date: Date,
        merchant: String
    ) {
        self.id = id
        self.amount = amount
        self.date = date
        self.merchant = merchant
    }
}
