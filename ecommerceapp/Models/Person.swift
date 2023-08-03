//
//  Person.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 2.08.2023.
//

import Foundation

struct Person: Identifiable {
    let id = UUID()
    var name: String
    var phone: String
    var email: String
    var birth: String
}

extension Person {
    
    static func all() -> Person {
        return
            Person(name: "Buğrahan Efe",phone: "+90 555 756 2067",email: "befe19", birth: "01.01.2001")
    }
}
