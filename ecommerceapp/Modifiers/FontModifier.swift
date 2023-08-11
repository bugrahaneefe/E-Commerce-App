//
//  FontModifier.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 6.08.2023.
//

import SwiftUI

struct FontModifier: ViewModifier {
    let size: CGFloat
    let name: String
    func body(content: Content) -> some View {
        content.font(.custom(name, size: size)).foregroundColor(.black)
    }
}

extension View {
    func poppinsMedium(size: CGFloat) -> some View {
        ModifiedContent(
            content: self,
            modifier: FontModifier(
                size: size,
                name: Constants.FontNames.poppinsMed.rawValue
            )
        )
    }
}
