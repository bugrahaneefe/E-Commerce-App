//
//  Buttons.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 6.08.2023.
//

import SwiftUI
import RealmSwift

struct ButtonSystemImage: View {
    var sysname: String
    var body: some View {
        Button(action: {
            // button action
        }) {
            Image(systemName: sysname)
                .foregroundColor(.gray)
                .padding(.top, 5)
        }
    }
}

struct ButtonAssetImage: View {
    var imagename: String
    var body: some View {
        Button(action: {
            // button action
        }) {
            Image(imagename)
        }
    }
}

struct ButtonWText: View {
    var text: String
    var backgroundColor: Color
    var cornerRadius: Double
    var fontSize: Double
    var body: some View {
        Button(action: {
            // button action
        }) {
            Text(text)
                .foregroundColor(.black)
                .background(backgroundColor)
                .cornerRadius(cornerRadius)
                .font(.custom(Constants.FontNames.poppinsMed.rawValue, size: fontSize))
        }
    }
}

struct DismissButton: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss() // Go back to the previous page
        }) {
            HStack {
                Image(systemName: "arrow.left")
            }
        }
    }
}

struct SortFilterView: View {
    var body: some View {
        HStack {
            Spacer()
            ButtonAssetImage(imagename: Constants.sort)
            Spacer()
            ButtonAssetImage(imagename: Constants.filter)
            Spacer()
        }.padding()
    }
}
