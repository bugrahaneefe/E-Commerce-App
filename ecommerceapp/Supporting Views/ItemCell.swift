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
    //    @State var furn: SetItems
    @State private var showAlert = false // Add a state variable to control the alert
    
    // ...
    
    var body: some View {
        
        ForEach(furnitureGroup.furnitures) { furn in
            if furn.category == categoryTitle {
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(5)
                    HStack(alignment: .center, spacing: 15) {
                        VStack(alignment: .leading) {
                            Button(action: {
                                do {
                                    let realm = try Realm()
                                    if let existingBuyedFurn = realm.objects(Furnitures.self).filter("name == %@ AND isBuyed == true", furn.name).first {
                                        showAlert = true // Show the alert when the item already exists
                                    } else {
                                        if let existingBuyedFurn = realm.objects(Furnitures.self).filter("name == %@ AND isBuyed == false", furn.name).first {
                                            try realm.write {
                                                let buyedFurn = Furnitures()
                                                existingBuyedFurn.isBuyed = true
                                            }
                                        }
                                    }
                                } catch {
                                    print("Error saving/updating items: \(error)")
                                }
                            })
                            {
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
                                    if let realm = try? Realm(), let existingFurn = realm.object(ofType: Furnitures.self, forPrimaryKey: furn.id) {
                                        do {
                                            try realm.write {
                                                existingFurn.isFavorite.toggle()
                                            }
                                        } catch {
                                            print("Error updating favorite status: \(error)")
                                        }
                                    }

                                }) {
                                    Image(systemName: furn.isFavorite ?? false ? "heart.fill" : "heart")
                                        .foregroundColor(furn.isFavorite ?? false ? .red : .gray)
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
                        }
                        .padding(.init(top: 15, leading: 3, bottom: 5, trailing: 3))
                        Spacer()
                    }
                    .frame(height: 170)
                    .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
                .alert(isPresented: $showAlert) { // Show the alert using the alert modifier
                    Alert(
                        title: Text("Item is already in your basket"),
                        message: Text(""),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
        }
    }
}
