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
                        FurnImage(imageName: furn.imageName)
                        // MARK: Furniture Details View
                        VStack(alignment: .leading, spacing: 19) {
                            HStack(alignment: .top, spacing: 8) {
                                VStack(spacing: 4) {
                                    // MARK: Price View
                                    FurnPrice(priceQuantitiy: furn.price, fontSize: 16)
                                    // MARK: Furniture Name View
                                    FurnName(furnName: furn.name)
                                }
                                // MARK: Delete From Favorites Button
                                Button {
                                    RealmManager.shared.deleteFromFavorite(furn)
                                } label: {
                                    DeleteIcon()
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
                                        Text(Constants.moveToBag)
                                            .poppinsMedium(size: 14)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(Color.ECDarkGray)
                                    }
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 0)
                                .frame(width: UIScreen.main.bounds.width * 0.3,
                                       height: UIScreen.main.bounds.height * 0.04,
                                       alignment: .center)
                                .background(Color.ECYellow)
                                .cornerRadius(8)
                            }
                            .padding(0)
                            .frame(height: UIScreen.main.bounds.height * 0.04, alignment: .center)
                        }.padding(0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(0)
                    .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .topLeading)
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
