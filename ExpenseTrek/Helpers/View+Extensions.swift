//
//  View+Extensions.swift
//  ExpenseTrek
//
//  Created by Linval Muchapirei on 12/12/2023.
//

import SwiftUI

extension View {
    @ViewBuilder
    func hSpacing(_ alignment: Alignment = .center) -> some View {
        self
        .frame(maxWidth: .infinity,alignment: alignment)
    }
    
    @ViewBuilder
    func vSpacing(_ alignment: Alignment = .center) -> some View {
        self
        .frame(maxHeight: .infinity,alignment: alignment)
    }
    var safeArea: UIEdgeInsets {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            return windowScene.keyWindow?.safeAreaInsets ?? .zero
        }
        return .zero
    }
}
