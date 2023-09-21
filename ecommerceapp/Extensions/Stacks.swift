//
//  Stacks.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 13.09.2023.
//

import SwiftUI

extension VStack {
    var profileItemStackEdit: some View {
        self.padding(.horizontal, 16)
            .padding(.vertical, 0)
            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.1)
            .background(Color.ECBackground)
            .cornerRadius(8)
    }
}
