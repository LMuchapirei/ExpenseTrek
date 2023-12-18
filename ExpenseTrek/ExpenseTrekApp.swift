//
//  ExpenseTrekApp.swift
//  ExpenseTrek
//
//  Created by Linval Muchapirei on 12/12/2023.
//

import SwiftUI

@main
struct ExpenseTrekApp: App {
    var body: some Scene {
        WindowGroup {
             ContentView()
        }
        .modelContainer(for:[Transaction.self])
    }
}
