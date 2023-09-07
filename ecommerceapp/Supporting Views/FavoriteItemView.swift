//
//  FavoriteItemView.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 6.08.2023.
//

import SwiftUI

struct FavoriteItemView: View {
    let furn: SetItems
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(furn.imageName).resizedImage
                    .cornerRadiusRectangle(5)
                    .frameCenter(width: 90, height: 120)
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Text(furn.name).poppinsMedium(size: 17)
                        Spacer()
                        ButtonSystemImage(sysname: "xmark.circle.fill")
                    }
                    Text("\(furn.price)")
                        .headlineBoldText
                        .poppinsMedium(size: 14)
                        .padding(.top, -5)
                    Spacer()
                    ButtonWText(text: Constants.moveToBag,
                                backgroundColor: .yellow,
                                cornerRadius: 5,
                                fontSize: 15)
                }
                .padding()
            }
            .frame(height: 80)
            .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
    }
}
