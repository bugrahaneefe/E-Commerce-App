//
//  ButtonsComponent.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 6.08.2023.
//

import SwiftUI

struct ButtonSystemImage: View {
    var sysname: String
    var body: some View {
        Button {
        } label: {
            Image(systemName: sysname)
                .foregroundColor(.gray)
                .padding(.top, 5)
        }
    }
}

struct ButtonAssetImage: View {
    var imagename: String
    var body: some View {
        Button {
        } label: {
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
        Button {
        } label: {
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
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
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

struct StepperButtonElements: View {
    var imageName: String
    var body: some View {
        Image(systemName: imageName)
            .foregroundColor(.black)
    }
}