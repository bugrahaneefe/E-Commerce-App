//
//  NavigationBarEdit.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 6.08.2023.
//

import SwiftUI

struct NavigationBarEdit: View {
    @Environment(\.screenFrame) var screenFrame
    let title: String
    let size: Double
    let height: Double
    var body: some View {
        HStack {
            Text("")
        }
        .frame(width: screenFrame.width, height: screenFrame.height * 0.1)
        .overlay(
            Text(title)
                .paddedText
                .poppinsMedium(size: size),
            alignment: .center)
        .background(Color("ecYellow"))
    }
}
struct NavigationBarEditWSave: View {
    @Environment(\.screenFrame) var screenFrame
    let title: String
    let size: Double
    var body: some View {
        HStack {
            Spacer()
            ButtonWText(text: "save".locally(),
                        backgroundColor: .white,
                        cornerRadius: 0,
                        fontSize: 10)
                .frame(height: 20)
        }
        .padding(.horizontal, 15)
        .frame(width: screenFrame.width, height: screenFrame.height * 0.05)
        .overlay(Text(title)
            .paddedText
            .poppinsMedium(size: size),
                 alignment: .center)
    }
}
