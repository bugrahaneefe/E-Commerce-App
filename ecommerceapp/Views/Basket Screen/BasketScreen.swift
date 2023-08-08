//
//  BasketScreen.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 1.08.2023.
//

import SwiftUI

struct BasketScreen: View {
    var ifArrIsEmpty: Bool = checkArrayEmpty(array: Furnitures.all())
    var body: some View {
        if ifArrIsEmpty {
            VStack {
                NavigationBarEdit(title: "basket".locally(), size: 20, height: 35)
                Spacer()
                ImageCenterView(imagename: Constants.images[5])
                TextViewBold(textname: "empty.bag".locally(), size: 16)
                TextViewCentered(
                    textname: "empty.bag.start.shop".locally(),
                                 size: 10)
                Spacer()
                ButtonWText(text: "str.shop".locally(),
                            backgroundColor: .yellow,
                            cornerRadius: 10,
                            fontName: Constants.fontNames[1],
                            fontSize: 20)
            }
        } else {
            CategoryItemViewInBasket()
        }
    }
}

func checkArrayEmpty(array: [Furnitures]) -> Bool {
    if array.count == 0 {
        return true
    } else {
        return false
    }
}

struct BasketScreen_Previews: PreviewProvider {
    static var previews: some View {
        BasketScreen()
    }
}
