//
//  Person.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 2.08.2023.
//

import SwiftUI
import RealmSwift

class Person: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String = ""
    @Persisted var phone: String = ""
    @Persisted var email: String = ""
    @Persisted var birthDate: String = ""
}
