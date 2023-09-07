//
//  Buttons.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 6.08.2023.
//

import SwiftUI
import RealmSwift

struct ButtonSystemImage: View {
    var sysname: String
    var body: some View {
        Button(action: {
            // button action
        }) {
            Image(systemName: sysname)
                .foregroundColor(.gray)
                .padding(.top, 5)
        }
    }
}

struct ButtonAssetImage: View {
    var imagename: String
    var body: some View {
        Button(action: {
            // button action
        }) {
            Image(imagename)
        }
    }
}

struct ButtonWText: View {
    var text: String
    var backgroundColor: Color
    var cornerRadius: Double
    var fontSize: Double
    var body: some View {
        Button(action: {
            // button action
        }) {
            Text(text)
                .foregroundColor(.black)
                .background(backgroundColor)
                .cornerRadius(cornerRadius)
                .font(.custom(Constants.FontNames.poppinsMed.rawValue, size: fontSize))
        }
    }
}

struct FavoriteButton: View {
    @State var furn: SetItems
    @State var furnInRealm: Furnitures? // Define furnInRealm as an optional

    var body: some View {

        Button(action: {
            do {
                self.furn.isFavorite.toggle()
                let realm = try Realm()
                if let existingFurnInRealm = realm.objects(Furnitures.self).filter("name == %@ AND imageName == %@", furn.name, furn.imageName).first {
                    self.furnInRealm = existingFurnInRealm // Assign the existingFurnInRealm to furnInRealm
                    if furn.isFavorite {
                        try realm.write {
                            furnInRealm?.isFavorite = true // Use furnInRealm here, it's an optional
                        }
                    } else {
                        try realm.write {
                            furnInRealm?.isFavorite = false // Use furnInRealm here, it's an optional
                        }
                    }
                }
            } catch {
                print("Error updating favorite status: \(error)")
            }
        }) {
            Image(systemName: furnInRealm?.isFavorite ?? false ? "heart.fill" : "heart")
                .foregroundColor(furnInRealm?.isFavorite ?? false ? .red : .gray)
                .frame(width: 40, height: 40)
                .background(Color.white)
        }
        .cornerRadius(20)
    }
}


struct DismissButton: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss() // Go back to the previous page
        }) {
            HStack {
                Image(systemName: "arrow.left")
            }
        }
    }
}

struct SortFilterView: View {
    var body: some View {
        HStack {
            Spacer()
            ButtonAssetImage(imagename: Constants.sort)
            Spacer()
            ButtonAssetImage(imagename: Constants.filter)
            Spacer()
        }.padding()
    }
}
