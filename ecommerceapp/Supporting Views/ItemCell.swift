//
//  ItemCell.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 6.08.2023.
//

import SwiftUI
import RealmSwift

struct ItemCell: View {
    @ObservedRealmObject var furnitureGroup: FurnituresGroup
    var categoryTitle: String
    @State private var showAlert = false
    var body: some View {
        ForEach(furnitureGroup.furnitures) { furn in
            if furn.category == categoryTitle {
                VStack {
                    HStack(alignment: .center, spacing: 10) {
                        VStack(alignment: .leading) {
                            Button(action: {
                                if RealmManager.updateIsBuyedStatusWithAlert(furn, isBuyed: furn.isBuyed) {
                                    showAlert = true
                                }
                            }) {
                                Image(furn.imageName)
                                    .resizedImage
                                    .cornerRadius(5)
                                    .frame(width: 164, height: 200) // Fixed frameCenter to frame
                            }
                            .cornerRadius(20)
                            HStack {
                                Text("$\(furn.price)")
                                    .headlineBoldText
                                Spacer()
                                Button(action: {
                                    RealmManager.toggleFavorite(furn, isFavorite: furn.isFavorite)
                                }) {
                                    Image(systemName: furn.isFavorite ? "heart.fill" : "heart")
                                        .foregroundColor(furn.isFavorite ? .red : .gray)
                                        .frame(width: 40, height: 40)
                                        .background(Color.white)
                                }
                                .cornerRadius(20)
                            }
                            HStack {
                                RatingView(rating: .constant(furn.rating))
                                Text("(\(furn.rating))")
                                    .footnoteText
                            }
                            Spacer()
                            Text(furn.name)
                            Spacer()
                        }
                        .padding(.init(top: 15, leading: 3, bottom: 5, trailing: 3))
                        Spacer()
                    }
                    .frame(height: 170)
                    .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
                .alert(isPresented: $showAlert) { // Show the alert using the alert modifier
                    Alert(
                        title: Text("is.already.in.basket".locally()),
                        message: Text(""),
                        dismissButton: .default(Text("ok".locally()))
                    )
                }
            }
        }
    }
}
