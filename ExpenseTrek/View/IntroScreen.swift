//
//  IntroScreen.swift
//  ExpenseTrek
//
//  Created by Linval Muchapirei on 12/12/2023.
//

import SwiftUI

struct IntroScreen: View {
    var body: some View {
        VStack (spacing:15){
            Text("What's New in the\nExpense Tracker")
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)
                .padding(.top,65)
                .padding(.bottom,35)
            
            /// Points View
            VStack(alignment: .leading,
                   spacing:25,content: {
                PointView(symbol: "dollarsign", title: "Transaction", subtitle: "Keep track of your earnings and expenses")
                PointView(symbol: "chart.bar.fill", title: "Visual Charts", subtitle: "View your transactions using eye-catching graphic representations.")
                PointView(symbol: "magnifyingglass", title: "Advance Filters", subtitle: "Find the expenses you want by advanced search and filtering")
            })
            .frame(maxWidth:.infinity,alignment: .leading)
            .padding(.horizontal,25)
            
            Spacer(minLength: 10)
            
            Button(action: {}, label: {
                Text("Continue")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical,14)
                    .background(appTint.gradient,in:.rect(cornerRadius: 12))
                    .contentShape(.rect)
            })
        }.padding(15)
    }
    
    /// Point View
    @ViewBuilder
    func PointView(symbol: String, title: String,subtitle: String)-> some View {
        HStack(spacing:15){
            Image(systemName: symbol)
                .font(.largeTitle)
                .foregroundStyle(appTint.gradient)
                .frame(width: 45)
            
            VStack(alignment: .leading,spacing: 6, content: {
                Text(title)
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text(subtitle)
                    .foregroundStyle(.gray)
            })
        }
    }
}

#Preview {
    IntroScreen()
}
