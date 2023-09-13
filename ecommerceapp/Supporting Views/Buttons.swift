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

struct StepperButton: View {
    @Binding var value: Int
    let range: ClosedRange<Int>

    var body: some View {
        HStack(spacing: 16.5) {
            Button(action: decrement) {
                Image(systemName: "minus")
            }
            Text("\(value)")
                .poppinsMedium(size: 14)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13))
            Button(action: increment) {
                Image(systemName: "plus")
            }
        }
    }

    private func increment() {
        if value < range.upperBound {
            value += 1
        }
    }

    private func decrement() {
        if value > range.lowerBound {
            value -= 1
        }
    }
}
