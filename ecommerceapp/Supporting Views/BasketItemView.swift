//
//  BasketItemView.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 6.08.2023.
//

import SwiftUI

struct BasketItemView: View {
    let furn: Furnitures
    @Binding var quantity: Int // Binding to keep track of the quantity for each item
    var body: some View {
        ZStack {
            HStack(alignment: .top) {
                ImageView(imagename: furn.imageName)
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        TextViewName(textname: furn.name)
                            .poppinsMedium(size: 17)
                        Spacer()
                        ButtonSystemImage(sysname: "trash")
                    }
                    TextViewHeadline(textname: "\(furn.price)")
                        .poppinsMedium(size: 14)
                        .padding(.top, -5)
                    Spacer()
                    HStack(alignment: .top) {
                        Spacer()
                        Stepper(value: $quantity, in: 0...5) {
                            Text("\(quantity)")
                        }
                    }
                    .background(Color.yellow)
                    .cornerRadius(5).frame(width: 120)
                }
                .padding(.init(top: 5, leading: 5, bottom: 5, trailing: 0))
                Spacer()
            }
            .frame(height: 130)
            .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
    }
}
