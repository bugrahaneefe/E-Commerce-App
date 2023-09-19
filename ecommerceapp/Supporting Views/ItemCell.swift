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
    var categoryTitle: String
    @State private var showAlert = false
    var body: some View {
        ForEach(furnitureGroup.furnitures) { furn in
            if furn.category == categoryTitle {
                VStack {
                    HStack(alignment: .center, spacing: 10) {
                        VStack(alignment: .leading) {
                            // MARK: Furniture Image View
                            Button {
                                if RealmManager.shared.updateIsBuyedStatusWithAlert(furn) {
                                    showAlert = true
                                }
                            } label: {
                                Image.FurnItemCellImage(imageName: furn.imageName)
                            }
                            .cornerRadius(20)
                            HStack {
                                // MARK: Furniture Price View
                                Text.FurnPrice(priceQuantitiy: furn.price)
                                Spacer()
                                // MARK: Furniture Favorite Button View
                                Button {
                                    RealmManager.shared.toggleFavorite(furn)
                                } label: {
                                    Image.FurnIsFavorite(isFavorite: furn.isFavorite)
                                }
                                .cornerRadius(20)
                            }
                            HStack {
                                // MARK: Furniture Rating View
                                RatingView(rating: .constant(furn.rating))
                                Text.FurnRatingText(rating: furn.rating)
                            }
                            Spacer()
                            // MARK: Furniture Name Text
                            Text.FurnItemCellName(furnName: furn.name)
                            Spacer()
                        }
                        .padding(.init(top: 15, leading: 3, bottom: 5, trailing: 3))
                        Spacer()
                    }
                    .frame(height: 170)
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
