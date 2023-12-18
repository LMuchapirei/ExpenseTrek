//
//  NewExpenseView.swift
//  ExpenseTrek
//
//  Created by Linval Muchapirei on 18/12/2023.
//

import SwiftUI

struct NewExpenseView: View {
    /// View Properties
    @State private var title: String = ""
    @State private var remarks: String = ""
    @State private var amount: Double = .zero
    @State private var dateAdded: Date = .now
    @State private var category: Category = .expense
    /// Random Tint
    var tint: TintColor = tints.randomElement()!
    
    var body: some View {
        ScrollView{
            VStack (spacing:15){
                Text("Preview")
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .hSpacing(.leading)
                
                /// Preview Card View
                TransactionCardView(transaction: .init(title: title.isEmpty ? "Title": title, remarks: remarks.isEmpty ? "Remarks":remarks, amount: amount, dateAdded: dateAdded, category: category, tintColor: tint))
                
                CustomSection("Title","Magic Keyboard",value: $title)
                
                CustomSection("Remarks","Apple Product",value: $remarks)
                
                /// Amount & Category Check box
                VStack(alignment: .leading,spacing: 10){
                    Text("Amount & Category")
                        .font(.caption)
                        .foregroundStyle(.gray)
                        .hSpacing(.leading)
                    
                    HStack(spacing:15){
                        TextField("0.0",value:$amount,formatter: numberFormatter)
                            .padding(.horizontal,15)
                            .padding(.vertical,12)
                            .background(.background,in:.rect(cornerRadius: 10))
                            .frame(maxWidth:130)
                            .keyboardType(.decimalPad)
                        
                        /// Custom Check Box
                        CategoryCheckBox()
                    }
                }
                
                /// Date Picker
                VStack(alignment: .leading,spacing: 10){
                    Text("Date")
                        .font(.caption)
                        .foregroundStyle(.gray)
                        .hSpacing(.leading)
                    DatePicker("",selection: $dateAdded,displayedComponents: [.date])
                        .datePickerStyle(.graphical)
                        .padding(.horizontal,15)
                        .padding(.vertical,12)
                        .background(.background,in:.rect(cornerRadius: 10))
                }
            }
            .padding(15)
        }
            .navigationTitle("Add Transaction")
            .background(.gray.opacity(0.15))
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save",action:{
                        
                    })
                }
            })
    }
    
    /// Saving Data
    func save(){
        
    }
    
    
    @ViewBuilder
    func CustomSection(_ title: String,_ hint:String,value: Binding<String>) -> some View {
        VStack(alignment:.leading,spacing: 10){
            Text(title)
                .font(.caption)
                .foregroundStyle(.gray)
                .hSpacing(.leading)
            
            TextField(hint,text: value)
                .padding(.horizontal,15)
                .padding(.vertical,12)
                .background(.background,in:.rect(cornerRadius: 10))
        }
    }
    
    @ViewBuilder
    func CategoryCheckBox()-> some View {
        HStack(spacing:10){
            ForEach(Category.allCases,id:\.rawValue){ category in
                HStack(spacing:5){
                    ZStack{
                        Image(systemName: "circle")
                            .font(.title3)
                            .foregroundStyle(appTint)
                        if self.category == category {
                            Image(systemName: "circle.fill")
                                .font(.caption)
                                .foregroundStyle(appTint)
                        }
                    }
                    Text(category.rawValue)
                }
                .contentShape(.rect)
                .onTapGesture {
                    self.category = category
                }
            }
            
        }
        .padding(.horizontal,15)
        .padding(.vertical,12)
        .hSpacing(.leading)
        .background(.background,in:.rect(cornerRadius: 10))
    }
    /// Number Formatter
    var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        
        return formatter
    }
}

#Preview {
    NewExpenseView()
}