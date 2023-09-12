//
//  Items.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 6.09.2023.
//

import SwiftUI
import RealmSwift

class Furnitures: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String = ""
    @Persisted var imageName: String = ""
    @Persisted var price: Int = 0
    @Persisted var rating: Int = 0
    @Persisted var isFavorite: Bool = false
    @Persisted var category: String = ""
    @Persisted var stepperValue: Int = 0
    @Persisted var isBuyed: Bool = false
    @Persisted(originProperty: "furnitures") var group: LinkingObjects<FurnituresGroup>
}

class FurnituresGroup: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var furnitures = RealmSwift.List<Furnitures>()
}

extension Furnitures {
//    static let furn1 = Furnitures(value: ["name": "Wooden Bedside Table",
//                                          "imageName": "woodtable",
//                                          "price": 2399,
//                                          "rating": 4,
//                                          "isFavorite": true,
//                                          "category": "bedroom",
//                                          "stepperValue": 0,
//                                          "isBuyed": false])
//    static let furn2 = Furnitures(value: ["name": "TV Table",
//                                          "imageName": "tvtable",
//                                          "price": 4000,
//                                          "rating": 4,
//                                          "isFavorite": false,
//                                          "category": "livingroom",
//                                          "stepperValue": 0,
//                                          "isBuyed": false])
//    static let furn3 = Furnitures(value: ["name": "Wood Mini-Table",
//                                          "imageName": "minitable",
//                                          "price": 500,
//                                          "rating": 3,
//                                          "isFavorite": false,
//                                          "category": "bedroom",
//                                          "stepperValue": 0,
//                                          "isBuyed": false])
//    static let furn4 = Furnitures(value: ["name": "Wood Chair",
//                                          "imageName": "woodchair",
//                                          "price": 1500,
//                                          "rating": 5,
//                                          "isFavorite": true,
//                                          "category": "dining",
//                                          "stepperValue": 0,
//                                          "isBuyed": false])
//    static let furnArray = [furn1, furn2, furn3, furn4]
    static func setup() {
        print(Realm.Configuration.defaultConfiguration.fileURL)
    }
}
