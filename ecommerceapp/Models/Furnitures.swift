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
    static func setup() {
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
}
