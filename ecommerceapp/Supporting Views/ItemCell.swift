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
                    VStack {
                        HStack(alignment: .center, spacing: 10) {
                            VStack(alignment: .leading) {
                                // MARK: Furniture Image View
                                Button {
                                    //                                if RealmManager.shared.updateIsBuyedStatusWithAlert(furn) {
                                    //                                    showAlert = true
                                    //                                }
                                } label: {
                                    NavigationLink(destination: FurnitureDetailViewInScreen(furn: furn)) {
                                        FurnItemCellImage(imageName: furn.imageName)
                                    }
                                }
                                .cornerRadius(20)
                                HStack {
                                    // MARK: Furniture Price View
                                    FurnPrice(priceQuantitiy: furn.price)
                                    Spacer()
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
                                Spacer()
                                // MARK: Furniture Name Text
                                FurnItemCellName(furnName: furn.name)
                                Spacer()
                            }
                            .padding(.init(top: 15, leading: 3, bottom: 5, trailing: 3))
                            Spacer()
                        }
                        .frame(height: UIScreen.main.bounds.height * 0.2)
                        .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
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
