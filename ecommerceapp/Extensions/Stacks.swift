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
            .frame(width: 343, height: 90, alignment: .leading)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(8)
    }
}
