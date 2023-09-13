//
//  FavoriteScreen.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 1.08.2023.
//

import SwiftUI
import RealmSwift

struct FavoriteScreen: View {
        @ObservedResults(FurnituresGroup.self) var furnituresGroups
        var isBasketEmpty: Bool {
            return furnituresGroups.first?.furnitures.contains(where: { $0.isFavorite }) != true
        }
        var body: some View {
            if isBasketEmpty {
                VStack {
                    NavigationBarEdit(title: "fav".locally(), size: 32, height: 114)
                    ScrollView {
                            VStack(alignment: .center, spacing: 16) {
                                // Surprised Emoji View
                                Image(Constants.EmojiImagesNames.surprised.rawValue)
                                    .frame(width: 120, height: 120)
                                VStack(alignment: .center, spacing: 4) {
                                    // Empty Favorite Text View
                                    Text("empty.fav".locally())
                                        .poppinsMedium(size: 24)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13))
                                        .frame(width: 229, alignment: .top)
                                    // Empty Favorite Description
                                    Text("empty.fav.desc".locally())
                                        .poppinsMedium(size: 16)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                                        .frame(width: 343, alignment: .top)
                                }
                            }
                            .frame(width: 375, height: 812)
                            .background(.white)
                            .cornerRadius(24)
                        }
                }
            } else {
                CategoryItemViewInFavorites(categoryTitle: Constants.favorite)
            }
        }
}

struct FavoriteScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteScreen()
    }
}
