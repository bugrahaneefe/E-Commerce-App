//
//  Buttons.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 6.08.2023.
//

import SwiftUI

struct ButtonSystemImage: View {
    var sysname: String
    var body: some View {
        Button(action: {
            // button action
        }) {
            ImageSystemView(imagename: sysname)
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
    var fontName: String
    var fontSize: Double
    var body: some View {
        Button(action: {
            // button action
        }) {
            Text(text)
                .foregroundColor(.black)
                .background(backgroundColor)
                .cornerRadius(cornerRadius)
                .font(.custom(fontName, size: fontSize))
        }
    }
}

struct FavoriteButton: View {
    @State var furn: Furnitures
    var body: some View {
        Button(action: {
            self.furn.isFavorite.toggle()
        }) {
            ImageSystemView(imagename: furn.isFavorite == true ? "heart.fill" : "heart")
                .foregroundColor(furn.isFavorite == true ? .red :.gray)
                .frame(width: 40, height: 40)
                .background(Color.white)
        }
        .cornerRadius(20)
    }
}

struct DismissButton: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss() // Go back to the previous page
        }) {
            HStack {
                ImageSystemView(imagename: "arrow.left")
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
