//
//  TextsComponent.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 20.09.2023.
//

import SwiftUI

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
struct TotalAmountText: View {
    var totalAmount: Int
    var body: some View {
        Text("$\(totalAmount)")
            .poppinsMedium(size: 18)
            .bold()
            .foregroundColor(Color.ECDarkGray)
    }
}
struct TotalText: View {
    var body: some View {
        Text("total.amount".locally())
            .poppinsMedium(size: 18)
            .bold()
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
struct FurnPrice: View {
    var priceQuantitiy: Int
    var fontSize: Double
    var body: some View {
        Text("$\(priceQuantitiy)")
            .poppinsMedium(size: fontSize)
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

struct FilterViewSheet: View {
    var title: String
    @Binding var bindingValue: Int
    var body: some View {
        HStack {
            Spacer()
            Text(title)
            Spacer()
            TextField(title, value: $bindingValue, formatter: NumberFormatter())
            Spacer()
        }
    }
}
