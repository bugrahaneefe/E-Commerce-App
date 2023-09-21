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
        var isFavoriteEmpty: Bool {
            return furnituresGroups.first?.furnitures.contains(where: { $0.isFavorite }) != true
        }
        var body: some View {
            if isFavoriteEmpty {
                VStack {
                    NavigationBarEdit(title: "fav".locally(), size: 32, height: UIScreen.main.bounds.height * 0.15)
                    ScrollView {
                            VStack(alignment: .center, spacing: 16) {
                                // MARK: Surprised Emoji View
                                Image.surprisedEmoji
                                VStack(alignment: .center, spacing: 4) {
                                    // MARK: Empty Favorite Text View
                                    EmptyViewText(emptyViewName: "empty.fav")
                                    // MARK: Empty Favorite Description
                                    EmptyDescriptionText(descName: "empty.fav.desc")
                                }
                            }
                            .frameCenter(width: UIScreen.main.bounds.width * 0.9,
                                         height: UIScreen.main.bounds.height * 0.8)
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
