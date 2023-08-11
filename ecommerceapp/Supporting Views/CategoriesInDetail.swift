//
//  CategoriesInDetail.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 6.08.2023.
//

import SwiftUI

struct CategoryItemViewInCategories: View {
    let arrFurn = Furnitures.all()
    let gridColumns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    var categoryTitle: String
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridColumns, spacing: 10) {
                ForEach(arrFurn) { furn in
                    if furn.category == categoryTitle {
                        ItemCell(furn: furn)
                            .frame(maxWidth: .infinity)
                    }
                }.padding(.vertical, 30)
            }.padding(.horizontal, 10)
        }
    }
}

struct CategoryItemViewInFavorites: View {
    let arrFurn = Furnitures.all()
    var categoryTitle: String
    var body: some View {
        VStack {
            NavigationBarEdit(title: categoryTitle, size: 20, height: 35)
            ScrollView {
                VStack {
                    ForEach(arrFurn.indices, id: \.self) { index in
                        if arrFurn[index].isFavorite {
                            FavoriteItemView(furn: arrFurn[index])
                        }
                    }.padding(.vertical, 30)
                }
            }
        }
    }
}

struct CategoryItemViewInBasket: View {
    let arrFurn = Furnitures.all()
    @State private var quantities: [Int]
    var totalPrice: Double {
        return zip(arrFurn, quantities)
            .reduce(0.0) { total, tuple in
                let (furn, quantity) = tuple
                return total + Double(quantity) * Double(furn.price)
            }
    }
    init() {
        _quantities = State(initialValue: Array(repeating: 1, count: arrFurn.count))
    }
    var body: some View {
        VStack {
            NavigationBarEdit(title: Constants.basket, size: 20, height: 35)
            ScrollView {
                VStack {
                    ForEach(arrFurn.indices, id: \.self) { index in
                        BasketItemView(furn: arrFurn[index], quantity: $quantities[index])
                    }.padding(.vertical, 30)
                }
            }
            HStack {
                Text(Constants.totalAmount)
                    .poppinsMedium(size: 16)
                Spacer()
                Text(Constants.total+String(format: "%.2f", totalPrice))
            }
            .padding(.horizontal, 15)
            .padding(.bottom, 5)
        }
    }
}
