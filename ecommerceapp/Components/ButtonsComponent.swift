//
//  ButtonsComponent.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 6.08.2023.
//

import SwiftUI

struct ButtonsComponent {
    @ViewBuilder
    static func buttonSystemImage(sysName: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(systemName: sysName)
                .foregroundColor(.gray)
                .padding(.top, 5)
        }
    }
    @ViewBuilder
    static func buttonAssetImage(imageName: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(imageName)
        }
    }
    @ViewBuilder
    static func buttonWithText(text: String,
                               backgroundColor: Color,
                               cornerRadius: Double,
                               fontSize: Double,
                               action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(text)
                .foregroundColor(.black)
                .background(backgroundColor)
                .cornerRadius(cornerRadius)
                .poppinsMedium(size: fontSize)
        }
    }
    @ViewBuilder
    static func stepperButtonElements(imageName: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(systemName: imageName)
                .foregroundColor(.black)
        }
    }
    struct SortFilterView: View {
        @Environment(\.screenFrame) var screenFrame
        @State private var isSortingOptionsPresented = false
        @State private var isFilteringOptionsPresented = false
        @Binding var sortingKeyPath: String
        @Binding var isAscending: Bool
        @Binding var maxRating: Int
        @Binding var minRating: Int
        @Binding var maxPrice: Int
        @Binding var minPrice: Int
        var body: some View {
            HStack {
                Spacer()
                ButtonsComponent.buttonAssetImage(imageName: Constants.sort) {
                    isSortingOptionsPresented.toggle()
                }.confirmationDialog("Sorting", isPresented: $isSortingOptionsPresented) {
                    Button("suggested".locally()) {
                        sortingKeyPath = "id"
                        isAscending = false
                    }
                    Button("name".locally()) {
                        sortingKeyPath = "name"
                        isAscending = true
                    }
                    Button("highest.price".locally()) {
                        sortingKeyPath = "price"
                        isAscending = false
                    }
                    Button("lowest.price".locally()) {
                        sortingKeyPath = "price"
                        isAscending = true
                    }
                    Button("highest.rating".locally()) {
                        sortingKeyPath = "rating"
                        isAscending = false
                    }
                }
                Spacer()
                ButtonsComponent.buttonAssetImage(imageName: Constants.filter) {
                    isFilteringOptionsPresented.toggle()
                }.sheet(isPresented: $isFilteringOptionsPresented) {
                    VStack {
                        List {
                            FilterViewSheet(title: "Max Rating: ", bindingValue: $maxRating)
                            FilterViewSheet(title: "Min Rating: ", bindingValue: $minRating)
                            FilterViewSheet(title: "Max Price: ", bindingValue: $maxPrice)
                            FilterViewSheet(title: "Min Price: ", bindingValue: $minPrice)
                            Spacer()
                        }
                        .background(Color.ECBackground)
                        Button("apply.filter".locally()) {
                            isFilteringOptionsPresented = false
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 0)
                        .frame(width: screenFrame.width * 0.3,
                               height: screenFrame.height * 0.04,
                               alignment: .center)
                        .background(Color.ECYellow)
                        .foregroundColor(Color.black)
                        .cornerRadius(8)
                    }
                    .background(Color.ECBackground)
                    .presentationDetents([.medium, .large])
                }
                Spacer()
            }.padding()
        }
    }
}
