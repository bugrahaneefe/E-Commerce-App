//
//  RealmManager.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 13.09.2023.
//

import SwiftUI
import RealmSwift

struct RealmManager {
    static func deleteFromBasket(_ furn: Furnitures, isBuyed: Bool) {
        do {
            if let realm = try? Realm(),
               let existingFurn = realm.object(ofType: Furnitures.self, forPrimaryKey: furn.id) {
                try realm.write {
                    existingFurn.isBuyed = false
                }
            } else {
                print("Item not found in the database.")
            }
        } catch {
            print("Error updating buyed status: \(error)")
        }
    }
    static func deleteFromFavorite(_ furn: Furnitures, isFavorite: Bool) {
        do {
            if let realm = try? Realm(),
               let existingFurn = realm.object(ofType: Furnitures.self, forPrimaryKey: furn.id) {
                try realm.write {
                    existingFurn.isFavorite = false
                }
            } else {
                print("Item not found in the database.")
            }
        } catch {
            print("Error updating favorite status: \(error)")
        }
    }
    static func updateIsBuyedStatusWithAlert(_ furn: Furnitures, isBuyed: Bool) -> Bool {
        do {
            let realm = try Realm()
            if realm.objects(Furnitures.self)
                .filter("name == %@ AND isBuyed == true", furn.name).first != nil {
                return true
            } else {
                if let existingBuyedFurn = realm.objects(Furnitures.self)
                    .filter("name == %@ AND isBuyed == false", furn.name).first {
                    try realm.write {
                        existingBuyedFurn.isBuyed = true
                    }
                }
                return false
            }
        } catch {
            print("Error saving/updating items: \(error)")
            return false
        }
    }
    static func toggleFavorite(_ furn: Furnitures, isFavorite: Bool) {
        if let realm = try? Realm(), let furn = realm.object(ofType: Furnitures.self, forPrimaryKey: furn.id) {
            do {
                try realm.write {
                    furn.isFavorite.toggle()
                }
            } catch {
                print("Error updating favorite status: \(error)")
            }
        }
    }
}
