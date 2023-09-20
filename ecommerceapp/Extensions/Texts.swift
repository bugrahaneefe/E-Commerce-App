//
//  Texts.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 10.08.2023.
//

import SwiftUI

extension Text {
    var headlineText: some View {
        self.font(.headline)
            .lineLimit(2)
            .foregroundColor(.black)
    }
    var headlineBoldText: some View {
        self.font(.headline)
            .lineLimit(2)
            .foregroundColor(.black)
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
    static let moveToBagText: some View = {
        Text(Constants.moveToBag)
            .poppinsMedium(size: 14)
            .multilineTextAlignment(.center)
            .foregroundColor(Color.ECDarkGray)
    }()
    static var totalText: some View = {
        Text(Constants.totalAmount)
            .poppinsMedium(size: 18)
            .bold()
            .foregroundColor(Color.ECDarkGray)
    }()
}
