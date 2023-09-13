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
        Text(title)
            .poppinsMedium(size: size)
            .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13))
            .frame(width: screenFrame.width-32, height: screenFrame.height * 0.1, alignment: .leadingLastTextBaseline)
    }
}

struct NavigationBarMainEdit: View {
    @Environment(\.screenFrame) var screenFrame
    let title: String
    let size: Double
    let height: Double
    var body: some View {
        Text(title)
            .poppinsMedium(size: size)
            .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13))
            .frame(width: screenFrame.width-32, height: screenFrame.height * 0.1, alignment: .centerLastTextBaseline)
    }
}

struct NavigationBarEditWithoutBackground: View {
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
    }
}
