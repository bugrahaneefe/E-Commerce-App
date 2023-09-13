//
//  BasketItemView.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 6.08.2023.
//

import SwiftUI
import RealmSwift

struct BasketItemView: View {
    @ObservedRealmObject var furnitureGroup: FurnituresGroup
    @State private var quantity: Int = 1 // Add a @State property for quantity
    var body: some View {
        ForEach(furnitureGroup.furnitures, id: \.self) { (furn: Furnitures) in
            if furn.isBuyed {
                VStack(alignment: .leading, spacing: 24) {
                    HStack(alignment: .top, spacing: 16) {
                        // Furniture Image View
                        Rectangle()
                          .foregroundColor(.clear)
                          .frame(width: 94, height: 115)
                          .background(
                            Image(furn.imageName)
                              .resizable()
                              .aspectRatio(contentMode: .fill)
                              .frame(width: 94, height: 115)
                              .clipped()
                          )
                          .cornerRadius(8)
                        VStack(alignment: .leading, spacing: 19) {
                            HStack(alignment: .top, spacing: 8) {
                                VStack(alignment: .leading, spacing: 4) {
                                    // Furniture Price View
                                    Text("$\(furn.price)")
                                      .font(
                                        Font.custom("Poppins", size: 16)
                                          .weight(.medium)
                                      )
                                      .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13))
                                      .frame(maxWidth: .infinity, alignment: .topLeading)
                                    // Furniture Name View
                                    Text(furn.name)
                                      .font(Font.custom("Poppins", size: 12))
                                      .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                                      .frame(maxWidth: .infinity, alignment: .topLeading)
                                }
                                .padding(0)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                // Furniture Delete From Basket Button View
                                Button(action: {
                                    do {
                                        let realm = try Realm()
                                        // Check the features of the item in the database
                                        if let furnInRealm = realm.objects(Furnitures.self).filter("name == %@ AND isBuyed == true", furn.name).first {
                                            // You can add more conditions here to check other features if needed
                                            try realm.write {
                                                furnInRealm.isBuyed = false
                                            }
                                        } else {
                                            print("Item not found in the database.")
                                        }
                                    } catch {
                                        print("Error deleting item: \(error)")
                                    }
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.gray)
                                        .frame(width: 24, height: 24)
                                }
                            }
                            .padding(0)
                            // Stepper View
                            HStack(alignment: .top, spacing: 10) {
                                CustomStepper(value: $quantity, range: 1...10)
                                    .foregroundColor(.black)
                            }
                            .padding(.horizontal, 8)
                            .padding(.top, 8)
                            .padding(.bottom, 7)
                            .frame(width: 98, height: 36, alignment: .top)
                            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                            .cornerRadius(8)
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(0)
                    .frame(width: 343, alignment: .topLeading)
                }
                .padding(16)
            }
        }
    }
}
