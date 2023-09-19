//
//  Texts.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 10.08.2023.
//

import SwiftUI

extension Text {
    var headlineText: some View {
        self.font(.headline)
            .lineLimit(2)
            .foregroundColor(.black)
    }
    var headlineBoldText: some View {
        self.font(.headline)
            .lineLimit(2)
            .foregroundColor(.black)
            .bold()
    }
    var paddedText: some View {
        self.padding(.horizontal, 10)
            .foregroundColor(.black)
    }
    var centeredText: some View {
        self.frame(alignment: .center)
            .bold()
            .foregroundColor(.black)
    }
    var centeredBoldText: some View {
        self.foregroundColor(.black)
            .multilineTextAlignment(.center)
            .padding()
    }
    var footnoteText: some View {
        self.font(.footnote)
            .foregroundColor(.gray)
    }
    struct FurnPrice: View {
        var priceQuantitiy: Int
        var body: some View {
            Text("$\(priceQuantitiy)")
                .poppinsMedium(size: 16)
                .foregroundColor(Color.ECDarkGray)
                .frame(maxWidth: .infinity, alignment: .topLeading)
        }
    }
    struct FurnName: View {
        var furnName: String
        var body: some View {
            Text(furnName)
                .poppinsMedium(size: 12)
                .foregroundColor(Color.ECLightGray)
                .frame(maxWidth: .infinity, alignment: .topLeading)
        }
    }
    struct FurnItemCellName: View {
        var furnName: String
        var body: some View {
            Text(furnName)
                .poppinsMedium(size: 12)
                .foregroundColor(Color.ECDarkGray)
                .frame(maxWidth: .infinity, alignment: .topLeading)
        }
    }
    struct FurnBuyedQuantity: View {
        var furnBuyedQuantity: Int
        var body: some View {
            Text("\(furnBuyedQuantity)")
                .poppinsMedium(size: 14)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.ECDarkGray)
        }
    }
    struct MoveToBagText: View {
        var body: some View {
            Text(Constants.moveToBag)
                .poppinsMedium(size: 14)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.ECDarkGray)
        }
    }
    struct FurnRatingText: View {
        var rating: Int
        var body: some View {
            Text("(\(rating))")
                .footnoteText
        }
    }
    struct TotalText: View {
        var body: some View {
            Text(Constants.totalAmount)
                .poppinsMedium(size: 18)
                .bold()
                .foregroundColor(Color.ECDarkGray)
        }
    }
    struct TotalAmountText: View {
        var totalAmount: Int
        var body: some View {
            Text("$\(totalAmount)")
                .poppinsMedium(size: 18)
                .bold()
                .foregroundColor(Color.ECDarkGray)
        }
    }
    struct EmptyViewText: View {
        var emptyViewName: String
        var body: some View {
            Text(emptyViewName.locally())
                .poppinsMedium(size: 24)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.ECDarkGray)
                .frame(width: 229, alignment: .top)
        }
    }
    struct EmptyDescriptionText: View {
        var descName: String
        var body: some View {
            Text(descName.locally())
                .poppinsMedium(size: 16)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.ECLightGray)
                .frame(width: 343, alignment: .top)
        }
    }
}
