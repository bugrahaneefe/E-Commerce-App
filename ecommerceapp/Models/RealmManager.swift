//
//  RealmManager.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 13.09.2023.
//

import SwiftUI
import RealmSwift

final class RealmManager {
    static let shared = RealmManager()
    private var realm: Realm?
    private init() {
        do {
            self.realm = try Realm()
        } catch {
            print("Error initializing Realm: \(error)")
        }
    }
    func deleteFromBasket(_ furn: Furnitures) {
        guard let realm = self.realm else {
            return
        }
        do {
            if let existingFurn = realm.object(ofType: Furnitures.self, forPrimaryKey: furn.id) {
                try realm.write {
                    existingFurn.isBuyed = false
                    existingFurn.buyedQuantity = 1
                }
            } else {
                print("Item not found in the database.")
                throw DBError.notFoundData
            }
        } catch {
            print("Error updating buyed status: \(error)")
        }
    }
    func deleteFromFavorite(_ furn: Furnitures) {
        guard let realm = self.realm else {
            return
        }
        do {
            if let existingFurn = realm.object(ofType: Furnitures.self, forPrimaryKey: furn.id) {
                try realm.write {
                    existingFurn.isFavorite = false
                }
            } else {
                print("Item not found in the database.")
                throw DBError.notFoundData
            }
        } catch {
            print("Error updating favorite status: \(error)")
        }
    }
    func updateIsBuyedStatusWithAlert(_ furn: Furnitures) -> Bool {
        guard let realm = self.realm else {
            return false
        }
        do {
            if let existingBuyedFurn = realm.objects(Furnitures.self)
                .filter("name == %@ AND isBuyed == false", furn.name).first {
                try realm.write {
                    existingBuyedFurn.isBuyed = true
                }
                return false
            }
            return true
        } catch {
            print("Error saving/updating items: \(error)")
            return false
        }
    }
    func toggleFavorite(_ furn: Furnitures) {
        guard let realm = self.realm else {
            return
        }
        if let furn = realm.object(ofType: Furnitures.self, forPrimaryKey: furn.id) {
            do {
                try realm.write {
                    furn.isFavorite.toggle()
                }
            } catch {
                print("Error updating favorite status: \(error)")
            }
        }
    }
    func incrementBuyedQuantity(_ furn: Furnitures, upperBound: Int) {
        guard let realm = self.realm else {
            return
        }
        do {
            if let existingFurn = realm.object(ofType: Furnitures.self, forPrimaryKey: furn.id) {
                try realm.write {
                    if existingFurn.buyedQuantity < upperBound {
                        existingFurn.buyedQuantity += 1
                    }
                }
            } else {
                print("Item not found in the database.")
                throw DBError.notFoundData
            }
        } catch {
            print("Error updating buyed status: \(error)")
        }
    }
    func decrementBuyedQuantity(_ furn: Furnitures, lowerBound: Int) {
        guard let realm = self.realm else {
            return
        }
        do {
            if let existingFurn = realm.object(ofType: Furnitures.self, forPrimaryKey: furn.id) {
                try realm.write {
                    if existingFurn.buyedQuantity > lowerBound {
                        existingFurn.buyedQuantity -= 1
                    }
                }
            } else {
                print("Item not found in the database.")
                throw DBError.notFoundData
            }
        } catch {
            print("Error updating buyed status: \(error)")
        }
    }
}

extension RealmManager {
    enum DBError: Error {
        case notFoundData
    }
}
