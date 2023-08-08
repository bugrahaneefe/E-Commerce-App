//
//  FavoriteItemView.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 6.08.2023.
//

import SwiftUI

struct FavoriteItemView: View {
    let furn: Furnitures
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                ImageView(imagename: furn.imageName)
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        TextViewName(textname: furn.name)
                            .poppinsMedium(size: 17)
                        Spacer()
                        ButtonSystemImage(sysname: "xmark.circle.fill")
                    }
                    TextViewHeadline(textname: "\(furn.price)")
                        .poppinsMedium(size: 14)
                        .padding(.top, -5)
                    Spacer()
                    ButtonWText(text: Constants.moveToBag,
                                backgroundColor: .yellow,
                                cornerRadius: 5,
                                fontName: Constants.fontNames[0],
                                fontSize: 15)
                }
                .padding()
            }
            .frame(height: 80)
            .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
    }
}
