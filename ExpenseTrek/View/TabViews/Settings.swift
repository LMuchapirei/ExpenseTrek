//
//  Settings.swift
//  ExpenseTrek
//
//  Created by Linval Muchapirei on 12/12/2023.
//

import SwiftUI

struct Settings: View {
    /// User Properties
    @AppStorage("userName") private var userName: String = ""
    /// App Lock Properties
    @AppStorage("isAppLockEnabled") private var isAppLockEnabled: Bool = false
    @AppStorage("lockWhenAppGoesBackground") private var lockWhenAppGoesBackground: Bool = false
    var body: some View {
        NavigationStack {
            List{
                Section("User Name"){
                    TextField("tTestName",text:$userName)
                }
                Section("App Lock"){
                    Toggle("Enable App Lock",isOn: $isAppLockEnabled)
                    
                    if isAppLockEnabled {
                        Toggle("Lock When App Goes Background",isOn: $lockWhenAppGoesBackground)
                    }
                }
            }.navigationTitle("Settings")
        }
    }
}


#Preview {
    Settings()
}
