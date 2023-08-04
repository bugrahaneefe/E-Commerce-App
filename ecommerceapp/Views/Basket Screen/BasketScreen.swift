//
//  BasketScreen.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 1.08.2023.
//

import SwiftUI

struct BasketScreen: View {
    let arrFurn = Furnitures.all()
    @State private var quantities: [Int] // Array to keep track of quantities for each item
    var totalPrice: Double {
        var total: Double = 0
        if arrFurn.count != 0 {
            for (index, furn) in arrFurn.enumerated() {
                total += Double(quantities[index]) * Double(furn.price)
            }
        }
        return total

    }
    init() {
        // Initialize quantities with all items set to 0 initially
        _quantities = State(initialValue: Array(repeating: 1, count: arrFurn.count))
    }
    var body: some View {
        if arrFurn.count != 0 {
            VStack {
                navigationBarEdit(title: "My Details")
                ScrollView {
                    VStack {
                        ForEach(arrFurn.indices, id: \.self) { index in
                            ItemCellBasket(furn: arrFurn[index], quantity: $quantities[index])
                        }.padding(.vertical, 30)
                    }
                }
                .navigationTitle("Basket")
                HStack {
                    Text("Total Amount")
                        .font(.custom("Poppins-Medium", size: 16))
                        .foregroundColor(.black)
                    Spacer()
                    Text("Total: $\(totalPrice, specifier: "%.2f")")
                }
                .padding(.horizontal, 15)
                .padding(.bottom, 5)
            }
        } else {
                VStack {
                    navigationBarEdit(title: "My Details")
                    Spacer()
                    Image("surprised")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 135, height: 180).padding()
                    Text("your bag is empty").bold().font(.custom("Poppins-Medium", size: 30))
                    Text("You do not have any item in your basket. Let's make you start shopping!")
                        .multilineTextAlignment(.center).padding()
                    Spacer()
                    Button(action: {
                        // Shopping navigator action
                    }) {
                        Text("Start Shopping")
                            .background(Color.yellow)
                            .cornerRadius(10)
                            .font(.custom("Poppins-Medium", size: 20))
                            .foregroundColor(.black)
                            .padding()
                    }
            }
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

struct ItemCellBasket: View {
    let furn: Furnitures
    @Binding var quantity: Int // Binding to keep track of the quantity for each item
    var body: some View {
        ZStack {
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
                            // trash button action
                        }) {
                            Image(systemName: "trash")
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

struct BasketScreen_Previews: PreviewProvider {
    static var previews: some View {
        BasketScreen()
    }
}
