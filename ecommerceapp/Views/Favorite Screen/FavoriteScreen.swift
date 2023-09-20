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
                                // MARK: Surprised Emoji View
                                Image.surprisedEmoji
                                VStack(alignment: .center, spacing: 4) {
                                    // MARK: Empty Favorite Text View
                                    Text.EmptyViewText(emptyViewName: "empty.fav")
                                    // MARK: Empty Favorite Description
                                    Text.EmptyDescriptionText(descName: "empty.fav.desc")
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
