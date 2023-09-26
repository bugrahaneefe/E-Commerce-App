//
//  CategoriesInDetail.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 6.08.2023.
//

import SwiftUI
import RealmSwift

struct CategoryItemViewInCategories: View {
    @ObservedResults(FurnituresGroup.self) var furnituresGroups
    @Binding var sortingKeyPath: String
    @Binding var isAscending: Bool
    @Binding var maxRating: Int
    @Binding var minRating: Int
    @Binding var maxPrice: Int
    @Binding var minPrice: Int
    let gridColumns = [
        GridItem(alignment: .center),
        GridItem(alignment: .center)
    ]
    var categoryTitle: String
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridColumns, spacing: 150) {
                if let furn = furnituresGroups.first {
                    ItemCell(furnitureGroup: furn,
                             sortingKeyPath: $sortingKeyPath,
                             isAscending: $isAscending,
                             maxRating: $maxRating,
                             minRating: $minRating,
                             maxPrice: $maxPrice,
                             minPrice: $minPrice,
                             categoryTitle: categoryTitle)
                }
            }
            .padding(.vertical, 68)
        }.labelsHidden()
    }
}

struct CategoryItemViewInFavorites: View {
    @ObservedResults(FurnituresGroup.self) var furnituresGroups
    var categoryTitle: String
    var body: some View {
        VStack {
            NavigationBarEdit(title: categoryTitle, size: 32, height: UIScreen.main.bounds.height * 0.15)
            ScrollView {
                VStack {
                    if let furn = furnituresGroups.first {
                        FavoriteItemView(furnitureGroup: furn)
                    }
                }
            }
        }
    }
}

struct CategoryItemViewInBasket: View {
    @ObservedResults(FurnituresGroup.self) var furnituresGroups
    // MARK: Total Amount Calculation
    var totalAmount: Int {
        var amount = 0
        if let furnituresList = furnituresGroups.first?.furnitures {
            for furn in Array(furnituresList) where furn.isBuyed {
                    amount += furn.price * furn.buyedQuantity
            }
        }
        return amount
    }
    var body: some View {
        VStack {
            NavigationBarEdit(title: Constants.basket, size: 32, height: UIScreen.main.bounds.height * 0.15)
            ScrollView {
                VStack {
                    if let furn = furnituresGroups.first {
                        BasketItemView(furnitureGroup: furn)
                    }
                }
            }
            HStack(alignment: .top, spacing: 63) {
                VStack(alignment: .leading, spacing: 4) {
                    // MARK: Total Text View
                    TotalText()
                }
                .padding(.leading, 0)
                .padding(.trailing, 70)
                .padding(.vertical, 0)
                VStack(alignment: .leading, spacing: 4) {
                    // MARK: Total Amount Text View
                    TotalAmountText(totalAmount: totalAmount)
                }
                .padding(.leading, 0)
                .padding(.trailing, 70)
                .padding(.vertical, 0)
            }
            .padding(.horizontal, 16)
            .padding(.top, 24)
            .padding(.bottom, 16)
        }
    }
}
