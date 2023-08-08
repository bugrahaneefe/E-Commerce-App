//
//  TextView.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 6.08.2023.
//

import SwiftUI

struct TextViewName: View {
    var textname: String
    var body: some View {
        Text(textname)
            .font(.headline)
            .lineLimit(2)
    }
}

struct TextViewHeadline: View {
    var textname: String
    var body: some View {
        Text("$\(textname)")
            .font(.headline)
            .foregroundColor(Color.black)
            .bold()
            .padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))

    }
}

struct TextViewHeadlinePp: View {
    var textname: String
    var body: some View {
        Text("\(textname)")
            .font(.headline)
            .foregroundColor(Color.black)
            .bold()
            .padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))

    }
}

struct TextViewTitle: View {
    var textname: String
    var size: Double
    var body: some View {
        Text(textname)
            .poppinsMedium(size: size)
            .foregroundColor(.black)
            .padding(.horizontal, 10)
    }
}

struct TextViewCentered: View {
    var textname: String
    var size: Double
    var body: some View {
        Text(textname)
            .poppinsMedium(size: size)
            .foregroundColor(.black)
            .bold()
    }
}

struct TextViewBold: View {
    var textname: String
    var size: Double
    var body: some View {
        Text(textname)
            .poppinsMedium(size: size)
            .foregroundColor(.black)
            .multilineTextAlignment(.center).padding()
    }
}

struct TextViewFootnote: View {
    var textname: String
    var body: some View {
        Text(textname)
            .font(.footnote)
            .foregroundColor(.gray)
    }
}

extension String {
    func locally() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
