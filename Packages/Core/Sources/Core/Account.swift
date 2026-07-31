import Foundation

public struct Account: Identifiable, Equatable {
    public let id: String
    public let name: String
    public let balance: Decimal
    public let currency: String

    public init(
        id: String,
        name: String,
        balance: Decimal,
        currency: String
    ) {
        self.id = id
        self.name = name
        self.balance = balance
        self.currency = currency
    }
}
