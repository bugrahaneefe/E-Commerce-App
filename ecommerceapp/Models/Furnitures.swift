//
//  Items.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 6.09.2023.
//

import Foundation
import RealmSwift

struct SetItems: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let price: Int
    let rating: Int
    var isFavorite: Bool
    let category: String
    var stepperValue: Int
    var isBuyed: Bool
    
    static func setup() {
        let arrFurn = SetItems.all()
        for index in 0..<arrFurn.count {
            let furn = arrFurn[index]
            do {
                let realm = try Realm()
                if let existingFurn = realm.objects(Furnitures.self).filter("name == %@ AND imageName == %@", furn.name, furn.imageName).first {
                    print("Furniture is already in database!")
                } else {
                    try realm.write {
                        let buyedFurn = Furnitures()
                        buyedFurn.name = furn.name
                        buyedFurn.imageName = furn.imageName
                        buyedFurn.price = furn.price
                        buyedFurn.rating = furn.rating
                        buyedFurn.isFavorite = furn.isFavorite
                        buyedFurn.category = furn.category
                        buyedFurn.stepperValue = furn.stepperValue
                        buyedFurn.isBuyed = furn.isBuyed
                        realm.add(buyedFurn)
                    }
                }
            } catch {
                print("Error saving/updating items: \(error)")
            }
        }
        print(Realm.Configuration.defaultConfiguration.fileURL)
    }
}

extension SetItems {
    static func all() -> [SetItems] {
        return [
            SetItems(name: "Wooden Bedside Table",
                       imageName: "woodtable",
                       price: 2399,
                       rating: 4,
                       isFavorite: true,
                       category: "bedroom",
                       stepperValue: 0,
                     isBuyed: false),
            SetItems(name: "Wood Chair",
                       imageName: "woodchair",
                       price: 1500,
                       rating: 5,
                       isFavorite: true,
                       category: "dining",
                       stepperValue: 0,
                     isBuyed: false),
            SetItems(name: "Wood Mini-Table",
                       imageName: "minitable",
                       price: 500,
                       rating: 3,
                       isFavorite: false,
                       category: "bedroom",
                       stepperValue: 0,
                     isBuyed: false),
            SetItems(name: "TV Table",
                       imageName: "tvtable",
                       price: 4000,
                       rating: 4,
                       isFavorite: false,
                       category: "livingroom",
                       stepperValue: 0,
                     isBuyed: false)
        ]
    }
}

class Furnitures: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var imageName: String = ""
    @objc dynamic var price: Int = 0
    @objc dynamic var rating: Int = 0
    @objc dynamic var isFavorite: Bool = false
    @objc dynamic var category: String = ""
    @objc dynamic var stepperValue: Int = 0
    @objc dynamic var isBuyed: Bool = false

    override static func primaryKey() -> String? {
        return "id"
    }
}

class BuyedFurnitures {
    static func importDataFromRealm() -> [SetItems] {
        do {
            let realm = try Realm()
            
            // Query all Furnitures objects from the Realm database
            let results = realm.objects(Furnitures.self).filter(NSPredicate(format: "isBuyed == true"))
            
            // Convert the Realm Results to a Swift array of SetItems
            let setItemsArray = results.map { furniture in
                return SetItems(
                    name: furniture.name,
                    imageName: furniture.imageName,
                    price: furniture.price,
                    rating: furniture.rating,
                    isFavorite: furniture.isFavorite,
                    category: furniture.category,
                    stepperValue: furniture.stepperValue,
                    isBuyed: furniture.isBuyed
                )
            }
            
            return Array(setItemsArray)
        } catch {
            print("Error accessing Realm: \(error)")
            return []
        }
    }
}

class FavoriedFurnitures {
    static func importDataFromRealm() -> [SetItems] {
        do {
            let realm = try Realm()
            // Query all Furnitures objects from the Realm database
            let results = realm.objects(Furnitures.self).filter(NSPredicate(format: "isFavorite == true"))
            // Convert the Realm Results to a Swift array of SetItems
            let setItemsArray = results.map { furniture in
                return SetItems(
                    name: furniture.name,
                    imageName: furniture.imageName,
                    price: furniture.price,
                    rating: furniture.rating,
                    isFavorite: furniture.isFavorite,
                    category: furniture.category,
                    stepperValue: furniture.stepperValue,
                    isBuyed: furniture.isBuyed
                )
            }
            return Array(setItemsArray)
        } catch {
            print("Error accessing Realm: \(error)")
            return []
        }
    }
}
