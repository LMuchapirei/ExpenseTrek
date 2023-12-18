//
//  ContentView.swift
//  ExpenseTrek
//
//  Created by Linval Muchapirei on 12/12/2023.
//

import SwiftUI

struct ContentView: View {
    /// Intro Visibility Status
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    /// App Lock Properties
    @AppStorage("isAppLockEnabled") private var isAppLockEnabled: Bool = false
    @AppStorage("lockWhenAppGoesBackground") private var lockWhenAppGoesBackground: Bool = false
    
    /// Active Tab
    @State private var activeTab: Tab = .recents
    var body: some View {
        LockView(lockType: .number, lockPin: "9001", isEnabled: isAppLockEnabled) {
            TabView(selection: $activeTab){
                Recents()
                    .tag(Tab.recents)
                    .tabItem { Tab.recents.tabContent
                    }
                Search()
                    .tag(Tab.search)
                    .tabItem { Tab.search.tabContent
                    }
                Graphs()
                    .tag(Tab.charts)
                    .tabItem { Tab.charts.tabContent
                    }
                Settings()
                    .tag(Tab.settings)
                    .tabItem { Tab.settings.tabContent
                    }
            }.tint(appTint)
            .sheet(isPresented: $isFirstTime, content: {
                    IntroScreen()
                    .interactiveDismissDisabled()
            })
        }
    }
}

#Preview {
    ContentView()
}
