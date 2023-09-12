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
    var body: some View {
        ForEach(furnitureGroup.furnitures) { (furn: Furnitures) in
            if furn.isFavorite {
                VStack(alignment: .leading, spacing: 24) {
                    HStack(alignment: .top, spacing: 16) {
                        // Furniture Image View
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 94, height: 115)
                            .background(
                                Image(furn.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 94, height: 115)
                                    .clipped()
                            )
                            .cornerRadius(8)
                        // Furniture Details View
                        VStack(alignment: .leading, spacing: 19) {
                            HStack(alignment: .top, spacing: 8) {
                                VStack(spacing: 4) {
                                    // Price View
                                    Text("$\(furn.price)")
                                        .font(
                                            Font.custom("Poppins", size: 16)
                                                .weight(.medium)
                                        )
                                        .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13))
                                        .frame(maxWidth: .infinity, alignment: .topLeading)
                                    // Furniture Name View
                                    Text(furn.name)
                                        .font(Font.custom("Poppins", size: 12))
                                        .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                                        .frame(maxWidth: .infinity, alignment: .topLeading)
                                }
                                // Delete From Favorites Button
                                Button(action: {
                                    if let realm = try? Realm(), let existingFurn = realm.object(ofType: Furnitures.self, forPrimaryKey: furn.id) {
                                        do {
                                            try realm.write {
                                                existingFurn.isFavorite = false
                                            }
                                        } catch {
                                            print("Error updating favorite status: \(error)")
                                        }
                                    }
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.top, 5)
                                }
                            }
                            .padding(0)
                            VStack(alignment: .center, spacing: 10) {
                                // Move to Bag View
                                HStack(alignment: .center, spacing: 10) {
                                    Button(action: {
                                        //move to bag action
                                    }) {
                                        Text(Constants.moveToBag)
                                            .font(
                                                Font.custom("Poppins", size: 14)
                                                    .weight(.medium)
                                            )
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13))
                                    }
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 0)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                .background(Color(red: 1, green: 0.89, blue: 0.25))
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
                
            }
        }
    }
}
