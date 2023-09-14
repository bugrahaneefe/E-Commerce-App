//
//  BasketScreen.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 1.08.2023.
//

import SwiftUI
import RealmSwift

struct BasketScreen: View {
    @ObservedResults(FurnituresGroup.self) var furnituresGroup
    var body: some View {
        if ((furnituresGroup.first?.isBasketEmpty) != nil) {
            VStack {
                NavigationBarEdit(title: "basket".locally(), size: 32, height: 114)
                ScrollView {
                        VStack(alignment: .center, spacing: 16) {
                            // Surprised Emoji View
                            Image(Constants.EmojiImagesNames.surprised.rawValue)
                                .frame(width: 120, height: 120)
                            VStack(alignment: .center, spacing: 4) {
                                // Empty Bag Text View
                                Text("empty.bag".locally())
                                    .poppinsMedium(size: 24)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13))
                                    .frame(width: 229, alignment: .top)
                                // Empty Bag Description
                                Text("empty.bag.desc".locally())
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
                HStack(alignment: .center, spacing: 8) {
                    ButtonWText(text: "str.shop".locally(),
                                backgroundColor: Color(red: 1, green: 0.89, blue: 0.25),
                                cornerRadius: 10,
                                fontSize: 20)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 0)
                .frame(width: 343, height: 64, alignment: .center)
                .background(Color(red: 1, green: 0.89, blue: 0.25))
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
