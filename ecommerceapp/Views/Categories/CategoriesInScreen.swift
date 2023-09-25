//
//  CategoryInScreen.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 1.08.2023.
//

import SwiftUI
import RealmSwift

enum CategoryInScreen {
    case bedroom
    case livingroom
    case dining
}

func getCategoryInScreen(categoryType: CategoryInScreen,
                         sortingKeyPath: Binding<String>,
                         isAscending: Binding<Bool>,
                         maxRating: Binding<Int>,
                         minRating: Binding<Int>,
                         maxPrice: Binding<Int>,
                         minPrice: Binding<Int>) -> some View {
    switch categoryType {
    case .bedroom:
        return VStack {
            ButtonsComponent.SortFilterView(sortingKeyPath: sortingKeyPath,
                                            isAscending: isAscending,
                                            maxRating: maxRating,
                                            minRating: minRating,
                                            maxPrice: maxPrice,
                                            minPrice: minPrice)
            CategoryItemViewInCategories(sortingKeyPath: sortingKeyPath,
                                         isAscending: isAscending,
                                         maxRating: maxRating,
                                         minRating: minRating,
                                         maxPrice: maxPrice,
                                         minPrice: minPrice,
                                         categoryTitle: Constants.CategoryImagesNames.bedroom.rawValue)
        }.navigationTitle("broom".locally())
    case .livingroom:
        return VStack {
            ButtonsComponent.SortFilterView(sortingKeyPath: sortingKeyPath,
                                            isAscending: isAscending,
                                            maxRating: maxRating,
                                            minRating: minRating,
                                            maxPrice: maxPrice,
                                            minPrice: minPrice)
            CategoryItemViewInCategories(sortingKeyPath: sortingKeyPath,
                                         isAscending: isAscending,
                                         maxRating: maxRating,
                                         minRating: minRating,
                                         maxPrice: maxPrice,
                                         minPrice: minPrice,
                                         categoryTitle: Constants.CategoryImagesNames.livingroom.rawValue)
        }.navigationTitle("lroom".locally())
    case .dining:
        return VStack {
            ButtonsComponent.SortFilterView(sortingKeyPath: sortingKeyPath,
                                            isAscending: isAscending,
                                            maxRating: maxRating,
                                            minRating: minRating,
                                            maxPrice: maxPrice,
                                            minPrice: minPrice)
            CategoryItemViewInCategories(sortingKeyPath: sortingKeyPath,
                                         isAscending: isAscending,
                                         maxRating: maxRating,
                                         minRating: minRating,
                                         maxPrice: maxPrice,
                                         minPrice: minPrice,
                                         categoryTitle: Constants.CategoryImagesNames.dining.rawValue)
        }.navigationTitle("droom".locally())
    }
}
struct FurnitureDetailViewInScreen: View {
    @State private var isAlertPresented = false
    var furn: Furnitures
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .foregroundColor(.clear)
                .background(
                    // MARK: Furniture Detail Image View
                    Image(furn.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                )
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .leading, spacing: 64) {
                VStack(alignment: .leading, spacing: 4) {
                    // MARK: Furniture Detail Price View
                    Text("$\(furn.price)")
                        .poppinsMedium(size: 24)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13))

                    // MARK: Furniture Detail Name View
                    Text(furn.name)
                        .poppinsMedium(size: 16)
                        .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                        .frame(width: 343, alignment: .topLeading)
                }
                .padding(0)

                // MARK: Furniture Detail buyIt View
                HStack(alignment: .center, spacing: 8) {
                    Button {
                        if RealmManager.shared.updateIsBuyedStatusWithAlert(furn) {
                            isAlertPresented = true
                        }
                    } label: {
                        HStack(spacing: 8) {
                            Text(Constants.buyIt)
                                .poppinsMedium(size: 14)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color.ECDarkGray)
                            Image(systemName: "bag")
                                .foregroundColor(Color.black)
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 0)
                .frame(maxWidth: .infinity, minHeight: 64, maxHeight: 64, alignment: .center)
                .background(Color(red: 1, green: 0.89, blue: 0.25))
                .cornerRadius(8)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 24)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        }
        .navigationTitle(furn.name + " Detail")
        .alert(isPresented: $isAlertPresented) {
            Alert(
                title: Text("is.already.in.basket".locally()),
                message: Text(""),
                dismissButton: .default(Text("ok".locally()))
            )
        }
    }
}
