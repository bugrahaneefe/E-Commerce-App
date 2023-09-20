//
//  BasketScreen.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 1.08.2023.
//

import SwiftUI
import RealmSwift

struct BasketScreen: View {
    @ObservedResults(FurnituresGroup.self) var furnituresGroups
    var isBasketEmpty: Bool {
        return furnituresGroups.first?.furnitures.contains(where: { $0.isBuyed }) != true
    }
    var body: some View {
        if isBasketEmpty {
            VStack {
                NavigationBarEdit(title: "basket".locally(), size: 32, height: UIScreen.main.bounds.height * 0.15)
                ScrollView {
                        VStack(alignment: .center, spacing: 16) {
                            // MARK: Surprised Emoji View
                            Image.surprisedEmoji
                            VStack(alignment: .center, spacing: 4) {
                                // MARK: Empty Bag Text View
                                EmptyViewText(emptyViewName: "empty.bag")
                                // MARK: Empty Bag Description
                                EmptyDescriptionText(descName: "empty.bag.desc")
                            }
                        }
                        .frameCenter(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.8)
                        .background(.white)
                        .cornerRadius(24)
                    }
                HStack(alignment: .center, spacing: 8) {
                    ButtonWText(text: "str.shop".locally(),
                                backgroundColor: Color.ECYellow,
                                cornerRadius: 10,
                                fontSize: 20)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 0)
                .frameCenter(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.05)
                .background(Color.ECYellow)
                .cornerRadius(8)
            }
        } else {
            CategoryItemViewInBasket()
        }
    }
}

struct BasketScreen_Previews: PreviewProvider {
    static var previews: some View {
        BasketScreen()
    }
}
