//
//  Date+Extensions.swift
//  ExpenseTrek
//
//  Created by Linval Muchapirei on 12/12/2023.
//

import SwiftUI


extension Date {
    /// these extensions will extract the start and end dates of the month from the given date
    var startOfMonth: Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year,.month], from: self)
        
        return calendar.date(from: components) ?? self
    }
    
    var endOfMonth: Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .init(month:1,minute: -1),to: self.startOfMonth) ?? self
    }
}
