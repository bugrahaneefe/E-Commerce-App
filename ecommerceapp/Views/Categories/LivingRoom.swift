//
//  Bedroom.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 1.08.2023.
//

import SwiftUI

struct LivingRoom: View {
    let arrFurn = Furnitures.all()
    let gridColumns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    @Environment(\.presentationMode) var presentationMode // Add this line to access the presentation mode
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: gridColumns, spacing: 10) {
                    ForEach(arrFurn) { furn in
                        if furn.category == "living" {
                            ItemCell(furn: furn)
                                .frame(maxWidth: .infinity)
                        }
                    }.padding(.vertical, 30)
                }.padding(.horizontal, 10)
            }.background(Color.init("f9f9f9"))
        }.navigationTitle("Living Room").navigationBarBackButtonHidden(true).toolbar {
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

struct LivingRoom_Previews: PreviewProvider {
    static var previews: some View {
        LivingRoom()
    }
}
