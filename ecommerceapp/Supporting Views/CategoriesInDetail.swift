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
    let gridColumns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    var categoryTitle: String
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridColumns, spacing: 10) {
                if let furn = furnituresGroups.first {
                    ItemCell(furnitureGroup: furn, categoryTitle: categoryTitle)
                }
            }
            .padding(.vertical, 68)
        }
    }
}


struct CategoryItemViewInFavorites: View {
    @ObservedResults(FurnituresGroup.self) var furnituresGroups
    var categoryTitle: String
    var body: some View {
        VStack {
            NavigationBarEdit(title: categoryTitle, size: 32, height: 114)
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
//    let arrFurn = BuyedFurnitures.importDataFromRealm()
    var body: some View {
        VStack {
            NavigationBarEdit(title: Constants.basket, size: 32, height: 114)
            ScrollView {
                VStack {
                    if let furn = furnituresGroups.first {
                        // Pass the ItemGroup objects to a view further
                        // down the hierarchy
                        BasketItemView(furnitureGroup: furn)
                    }
//                    ForEach(arrFurn.indices, id: \.self) { index in
//                        BasketItemView(furn: arrFurn[index], quantity: $quantities[index])
//                    }
                }
            }
            HStack {
                Text(Constants.totalAmount)
                    .poppinsMedium(size: 16)
                Spacer()
            }
            .padding(.horizontal, 15)
            .padding(.bottom, 5)
        }
    }
}
