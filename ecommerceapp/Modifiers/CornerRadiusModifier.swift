//
//  CornerRadiusModifier.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 10.08.2023.
//

import Foundation
import SwiftUI

struct CornerRadiusModifier: ViewModifier {
    var cornerRadius: CGFloat
    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}

extension View {
    func cornerRadiusRectangle(_ cornerRadius: CGFloat) -> some View {
        modifier(CornerRadiusModifier(cornerRadius: cornerRadius))
    }
}
