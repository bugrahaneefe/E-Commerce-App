//
//  Texts.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 10.08.2023.
//

import Foundation
import SwiftUI

extension Text {
    func ECHeadlineText() -> some View {
        self.font(.headline)
            .lineLimit(2)
            .foregroundColor(Color.black)
    }
    func ECHeadlineBoldText() -> some View {
        self.font(.headline)
            .lineLimit(2)
            .foregroundColor(Color.black)
            .bold()
    }
    func ECPaddedText() -> some View {
        self.padding(.horizontal, 10)
            .foregroundColor(.black)
    }
    func ECCenteredText() -> some View {
        self.frame(alignment: .center)
            .bold()
            .foregroundColor(.black)
    }
    func ECCenteredBoldText() -> some View {
        self.foregroundColor(.black)
            .multilineTextAlignment(.center)
            .padding()
    }
    func ECFootnoteText() -> some View {
        self.font(.footnote)
            .foregroundColor(.gray)
    }
}
