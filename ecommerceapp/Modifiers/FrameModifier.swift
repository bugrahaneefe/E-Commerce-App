//
//  FrameModifier.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 10.08.2023.
//

import Foundation
import SwiftUI

struct FrameModifier: ViewModifier {
    var width: CGFloat?
    var height: CGFloat?
    var alignment: Alignment
    func body(content: Content) -> some View {
        if let width = width, let height = height {
            return AnyView(content.frame(width: width, height: height, alignment: alignment))
        } else {
            return AnyView(content)
        }
    }
}

extension View {
    func frameCenter(width: CGFloat? = nil, height: CGFloat? = nil) -> some View {
        modifier(FrameModifier(width: width, height: height, alignment: .center))
    }
    func frameBottom(width: CGFloat? = nil, height: CGFloat? = nil) -> some View {
        modifier(FrameModifier(width: width, height: height, alignment: .bottom))
    }
    func frameLeading(width: CGFloat? = nil, height: CGFloat? = nil) -> some View {
        modifier(FrameModifier(width: width, height: height, alignment: .leading))
    }
}
