//
//  Bedroom.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 1.08.2023.
//

import SwiftUI

struct Bedroom: View {
    @Environment(\.presentationMode) var presentationMode // Add this line to access the presentation mode

    let arrFurn = Furnitures.all()
    let gridColumns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        VStack{
            ScrollView {
                LazyVGrid(columns: gridColumns, spacing: 10) {
                    ForEach(arrFurn) { furn in
                        ItemCell(furn: furn)
                            .frame(maxWidth: .infinity)
                    }.padding(.vertical, 30)
                }.padding(.horizontal, 10)
            }.background(Color.init("f9f9f9"))
        }.navigationTitle("Bedroom").navigationBarBackButtonHidden(true).toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // Go back to the previous page
                }) {
                    HStack {
                        Image(systemName: "arrow.left")
                    }
                }
            }
        }
        
    }
    
    
}

struct ItemCell: View {
    
    let furn: Furnitures
    
    var body: some View {
        
        ZStack() {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(5)
                .shadow(color: Color.init("dddddd"), radius: 2, x: 0.8, y: 0.8)
            
            HStack() {
                VStack(alignment: .leading) {
                    Image(furn.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 120)
                        .cornerRadius(5)
                    Text(furn.name)
                        .font(.headline)
                        .lineLimit(2)
                    Spacer()
                    HStack {
                        RatingView(rating: .constant(furn.rating))
                        Text("(\(furn.rating))")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    
                    HStack {
                        Text("$\(furn.price)")
                            .font(.headline)
                            .foregroundColor(Color.black)
                            .bold()
                            .padding(.init(top: 0,leading: 0, bottom: 10,trailing: 0))
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: furn.isFavorite == true ? "heart.fill" : "heart")
                                .foregroundColor(furn.isFavorite == true ? .red :.gray)
                                .frame(width: 40, height: 40)
                                .background(Color.white)
                        }
                        .cornerRadius(20)
                        .shadow(color: Color.init("dddddd"), radius: 2, x: 0.8, y: 0.8)
                    }
                }.padding(.init(top: 15, leading: 3, bottom: 5, trailing: 3 ))
                Spacer()
            }
            .frame(height: 170)
            .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
    }
}



struct Bedroom_Previews: PreviewProvider {
    static var previews: some View {
        Bedroom()
    }
}
