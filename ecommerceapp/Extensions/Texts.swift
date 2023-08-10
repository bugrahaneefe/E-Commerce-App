//
//  Texts.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 10.08.2023.
//

import Foundation
import SwiftUI

extension Text {
    var headlineText: some View {
        self.font(.headline)
            .lineLimit(2)
            .foregroundColor(Color.black)
    }
    var headlineBoldText: some View {
        self.font(.headline)
            .lineLimit(2)
            .foregroundColor(Color.black)
            .bold()
    }
    var paddedText: some View {
        self.padding(.horizontal, 10)
            .foregroundColor(.black)
    }
    var centeredText: some View {
        self.frame(alignment: .center)
            .bold()
            .foregroundColor(.black)
    }
    var centeredBoldText: some View {
        self.foregroundColor(.black)
            .multilineTextAlignment(.center)
            .padding()
    }
    var footnoteText: some View {
        self.font(.footnote)
            .foregroundColor(.gray)
    }
}
