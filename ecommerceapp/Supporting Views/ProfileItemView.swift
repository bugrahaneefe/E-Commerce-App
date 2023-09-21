//
//  ProfileItemView.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 6.08.2023.
//

import SwiftUI
import RealmSwift

struct ProfileItemView: View {
    @ObservedRealmObject var person: Person
    var body: some View {
        // Full Name Textfield
        ProfileScreen.ProfileItemCell(rowIndex: 0, name: $person.name)
        // Phone Textfield
        ProfileScreen.ProfileItemCell(rowIndex: 1, name: $person.phone)
        // Email Textfield
        ProfileScreen.ProfileItemCell(rowIndex: 2, name: $person.email)
        // BirthDate Textfield
        ProfileScreen.ProfileItemCell(rowIndex: 3, name: $person.birthDate)
    }
}
