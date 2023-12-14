//
//  DateFilterView.swift
//  ExpenseTrek
//
//  Created by Linval Muchapirei on 14/12/2023.
//

import SwiftUI

struct DateFilterView: View {
    @State private var start: Date
    @State private var end: Date
    var onSubmit:(Date,Date)->()
    var onClose: ()-> ()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}


