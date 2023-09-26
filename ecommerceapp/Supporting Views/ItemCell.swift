//
//  ItemCell.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 6.08.2023.
//

import SwiftUI
import RealmSwift

struct ItemCell: View {
    @ObservedRealmObject var furnitureGroup: FurnituresGroup
    @Environment(\.screenFrame) var screenFrame
    @State private var showAlert = false
    @Binding var sortingKeyPath: String
    @Binding var isAscending: Bool
    @Binding var maxRating: Int
    @Binding var minRating: Int
    @Binding var maxPrice: Int
    @Binding var minPrice: Int
    var categoryTitle: String
    var body: some View {
        ForEach(furnitureGroup
            .furnitures
            .sorted(byKeyPath: sortingKeyPath, ascending: isAscending)
            .filter { furn in
                return furn.rating <= maxRating &&
                furn.rating >= minRating &&
                furn.price <= maxPrice &&
                furn.price >= minPrice
            }) { furn in
                if furn.category == categoryTitle {
                    VStack(alignment: .center) {
                        HStack(spacing: 15) {
                            VStack {
                                // MARK: Furniture Image View
                                Button {
                                } label: {
                                    NavigationLink(destination: FurnitureDetailViewInScreen(furn: furn)) {
                                        FurnItemCellImage(imageName: furn.imageName)
                                    }
                                }
                                .cornerRadius(20)
                                HStack {
                                    // MARK: Furniture Price View
                                    FurnPrice(priceQuantitiy: furn.price, fontSize: 16)
                                        .padding(.horizontal)
                                    // MARK: Furniture Favorite Button View
                                    Button {
                                        RealmManager.shared.toggleFavorite(furn)
                                    } label: {
                                        FurnIsFavorite(isFavorite: furn.isFavorite)
                                    }
                                    .cornerRadius(20)
                                }
                                HStack {
                                    // MARK: Furniture Rating View
                                    RatingView(rating: .constant(furn.rating))
                                    FurnRatingText(rating: furn.rating)
                                }
                                // MARK: Furniture Name Text
                                FurnItemCellName(furnName: furn.name)
                                    .padding(.horizontal)
                            }
                            .frame(width: screenFrame.width * 0.45, height: screenFrame.height * 0.75)
                        }.frame(height: screenFrame.height * 0.2)
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("is.already.in.basket".locally()),
                            message: Text(""),
                            dismissButton: .default(Text("ok".locally()))
                        )
                    }
                }
            }
    }
}
