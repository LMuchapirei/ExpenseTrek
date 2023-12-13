//
//  Transaction.swift
//  ExpenseTrek
//
//  Created by Linval Muchapirei on 12/12/2023.
//

import Foundation
import SwiftUI

struct Transaction: Identifiable {
    let id: UUID = .init()
    /// Properties
    var title: String
    var remarks: String
    var amount: Double
    var dateAdded: Date
    var category: String
    var tintColor: String
    
    init(title: String, remarks: String, amount: Double, dateAdded: Date, category: Category, tintColor: TintColor) {
        self.title = title
        self.remarks = remarks
        self.amount = amount
        self.dateAdded = dateAdded
        self.category = category.rawValue
        self.tintColor = tintColor.color
    }
    
    /// Extracting Color Value from tintColor String
    var color: Color {
        return tints.first(where: { $0.color == tintColor})?.value ?? appTint
    }
}

/// Sample Transactions for UI Building

var sampleTransactions: [Transaction] = [
    .init(title: "KeyCron V2", remarks: "Special Keyboard", amount: 129, dateAdded: .now, category: .expense, tintColor: tints.randomElement()!),
    .init(title: "Spotify", remarks: "Subscription", amount: 2.99, dateAdded: .now, category: .expense, tintColor: tints.randomElement()!),
    .init(title: "Payment", remarks: "Payment Monthly", amount: 2893, dateAdded: .now, category: .income, tintColor: tints.randomElement()!),
    .init(title: "Coursera+", remarks: "Subscription", amount: 12.99, dateAdded: .now, category: .expense, tintColor: tints.randomElement()!)
]
