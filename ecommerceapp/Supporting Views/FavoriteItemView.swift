//
//  FavoriteItemView.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 6.08.2023.
//

import SwiftUI
import RealmSwift

struct FavoriteItemView: View {
    @ObservedRealmObject var furnitureGroup: FurnituresGroup
    @State private var showAlert = false
    var body: some View {
        ForEach(furnitureGroup.furnitures) { (furn: Furnitures) in
            if furn.isFavorite {
                VStack(alignment: .leading, spacing: 24) {
                    HStack(alignment: .top, spacing: 16) {
                        // MARK: Furniture Image View
                        Image.FurnImage(imageName: furn.imageName)
                        // MARK: Furniture Details View
                        VStack(alignment: .leading, spacing: 19) {
                            HStack(alignment: .top, spacing: 8) {
                                VStack(spacing: 4) {
                                    // MARK: Price View
                                    Text.FurnPrice(priceQuantitiy: furn.price)
                                    // MARK: Furniture Name View
                                    Text.FurnName(furnName: furn.name)
                                }
                                // MARK: Delete From Favorites Button
                                Button {
                                    RealmManager.shared.deleteFromFavorite(furn)
                                } label: {
                                    Image.DeleteIcon()
                                }
                            }
                            .padding(0)
                            VStack(alignment: .center, spacing: 10) {
                                // MARK: Move to Bag View
                                HStack(alignment: .center, spacing: 10) {
                                    Button {
                                        if RealmManager.shared.updateIsBuyedStatusWithAlert(furn) {
                                            showAlert = true
                                        }
                                    } label: {
                                        Text.MoveToBagText()
                                    }
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 0)
                                .frame(width: 152, height: 32, alignment: .center)
                                .background(Color.ECBackground)
                                .cornerRadius(8)
                            }
                            .padding(0)
                            .frame(height: 36, alignment: .center)
                        }.padding(0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(0)
                    .frame(width: 343, alignment: .topLeading)
                }
                .padding(16)
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
