//
//  BasketScreen.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 1.08.2023.
//

import SwiftUI

struct BasketScreen: View {
    var ifArrIsEmpty: Bool = checkArrayEmpty(array: SetItems.all())
    var body: some View {
        if ifArrIsEmpty {
            VStack {
                NavigationBarEdit(title: "basket".locally(), size: 20, height: 35)
                Spacer()
                Image(Constants.EmojiImagesNames.surprised.rawValue)
                    .centerImage
                    .frameCenter(width: 135, height: 180)
                Text("empty.bag".locally())
                    .headlineBoldText
                    .poppinsMedium(size: 16)
                Text("empty.bag.start.shop".locally())
                    .poppinsMedium(size: 10)
                Spacer()
                ButtonWText(text: "str.shop".locally(),
                            backgroundColor: .yellow,
                            cornerRadius: 10,
                            fontSize: 20)
            }
        } else {
            CategoryItemViewInBasket()
        }
    }
}

func checkArrayEmpty(array: [SetItems]) -> Bool {
    if array.isEmpty {
        return true
    }
    return false
}

struct BasketScreen_Previews: PreviewProvider {
    static var previews: some View {
        BasketScreen()
    }
}
