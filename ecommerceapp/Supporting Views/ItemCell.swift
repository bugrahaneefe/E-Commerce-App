//
//  ItemCell.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 6.08.2023.
//

import SwiftUI

struct ItemCell: View {
    @State var furn: Furnitures
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(5)
            HStack {
                VStack(alignment: .leading) {
                    Button(action: {
                        // furniture must be added to database for adding to bag
                    }) {
                        ImageView(imagename: furn.imageName)
                            .cornerRadius(5)
                    }
                    .cornerRadius(20)
                    TextViewName(textname: furn.name)
                    Spacer()
                    HStack {
                        RatingView(rating: .constant(furn.rating))
                        TextViewFootnote(textname: "(\(furn.rating))")
                    }
                    HStack {
                        TextViewHeadline(textname: "\(furn.price)")
                        Spacer()
                        FavoriteButton(furn: furn)
                    }
                }.padding(.init(top: 15, leading: 3, bottom: 5, trailing: 3 ))
                Spacer()
            }
            .frame(height: 170)
            .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
    }
}
