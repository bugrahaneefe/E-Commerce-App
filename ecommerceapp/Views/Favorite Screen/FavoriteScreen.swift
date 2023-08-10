//
//  FavoriteScreen.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 1.08.2023.
//

import SwiftUI

struct FavoriteScreen: View {
    var body: some View {
        CategoryItemViewInFavorites(categoryTitle: Constants.categoryTitles[0])
    }
}

struct FavoriteScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteScreen()
    }
}
