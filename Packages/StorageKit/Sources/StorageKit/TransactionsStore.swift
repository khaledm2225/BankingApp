//
//  File.swift
//  StorageKit
//
//  Created by Khaled Mohamed on 01/08/2026.
//

import Foundation
import Core

public protocol TransactionsStore {
    
    func fetch(account: String) -> (transtions: [Transaction], capturedAt: Date)?
    func insert(_ transactions: [Transaction], accountID: String, capturedAt: Date)
    func delete(accountID: String)
    
}
