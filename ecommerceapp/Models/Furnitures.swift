//
//  Furnitures.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 1.08.2023.
//

import Foundation

struct Furnitures: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let price: Int
    let rating: Int
    var isFavorite: Bool
    let category: String
    var stepperValue: Int
}

extension Furnitures {
    static func all() -> [Furnitures] {
        return [
            Furnitures(name: "Wooden Bedside Table",
                       imageName: "woodtable",
                       price: 2399,
                       rating: 4,
                       isFavorite: false,
                       category: "bedroom",
                       stepperValue: 0),
            Furnitures(name: "Wood Chair",
                       imageName: "woodchair",
                       price: 1500,
                       rating: 5,
                       isFavorite: true,
                       category: "dining",
                       stepperValue: 0),
            Furnitures(name: "Wood Mini-Table",
                       imageName: "minitable",
                       price: 500,
                       rating: 3,
                       isFavorite: false,
                       category: "bedroom",
                       stepperValue: 0),
            Furnitures(name: "TV Table",
                       imageName: "tvtable",
                       price: 4000,
                       rating: 4,
                       isFavorite: false,
                       category: "living",
                       stepperValue: 0)
        ]
    }
}
