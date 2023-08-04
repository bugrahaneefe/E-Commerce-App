//
//  FavoriteScreen.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 1.08.2023.
//

import SwiftUI

struct FavoriteScreen: View {
    let arrFurn = Furnitures.all()
    var body: some View {
        VStack {
            navigationBarEdit(title: "Favorites")
            ScrollView {
                VStack {
                    ForEach(arrFurn.indices, id: \.self) { index in
                        if arrFurn[index].isFavorite {
                            ItemCellFav(furn: arrFurn[index])
                        }
                    }.padding(.vertical, 30)
                }
            }
            .navigationTitle("Basket")
        }
    }
    
    func navigationBarEdit(title: String) -> some View {
        return HStack {
            Text("")
        }
        .padding(.horizontal, 15)
        .frame(width: UIScreen.main.bounds.width, height: 35)
        .overlay(
            Text(title)
                .font(.custom("Poppins-Medium", size: 20))
                .foregroundColor(.black)
                .padding(.horizontal, 10)
            , alignment: .center)
    }
}

struct ItemCellFav: View {
    let furn: Furnitures
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(furn.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 90, height: 120)
                    .cornerRadius(1).padding()
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Text(furn.name)
                            .font(.custom("Poppins-Medium", size: 17))
                            .foregroundColor(.black)
                            .lineLimit(1)
                        Spacer()
                        Button(action: {
                            // remove button action
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                                .padding(.top, 5)
                        }
                    }
                    Text("$\(furn.price)")
                        .font(.custom("Poppins-Medium", size: 14))
                        .foregroundColor(.black
                        )
                        .padding(.top, -5)
                    Spacer()
                    Button(action: {
                        // add to basket button action
                    }) {
                        Text("Move to Bag").background(Color.yellow)
                            .cornerRadius(5).foregroundColor(.black)
                    }
                }
                .padding()
            }
            .frame(height: 80)
            .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
    }
}

struct FavoriteScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteScreen()
    }
}
