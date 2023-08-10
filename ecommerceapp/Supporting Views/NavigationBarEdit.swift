//
//  NavigationBarEdit.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 6.08.2023.
//

import SwiftUI

struct NavigationBarEdit: View {
    @Environment(\.frameWidthValue) var frameWidthValue
    let title: String
    let size: Double
    let height: Double
    var body: some View {
        HStack {
            Text("")
        }
        .frame(width: frameWidthValue, height: height)
        .overlay(
            Text(title).ECPaddedText().poppinsMedium(size: size),
            alignment: .center)
        .background(Color(UIColor(red: 254/255,
                                  green: 228/255,
                                  blue: 64/255,
                                  alpha: 1)))
    }
}
struct NavigationBarEditWSave: View {
    @Environment(\.frameWidthValue) var frameWidthValue
    let title: String
    let size: Double
    let height: Double
    var body: some View {
        HStack {
            Spacer()
            ButtonWText(text: "save".locally(),
                        backgroundColor: .white,
                        cornerRadius: 0,
                        fontName: Constants.fontNames[0],
                        fontSize: 10)
                .frame(height: 30)
        }
        .padding(.horizontal, 15)
        .frame(width: frameWidthValue, height: height)
        .overlay(Text(title).ECPaddedText().poppinsMedium(size: size),
                 alignment: .center)
    }
}
