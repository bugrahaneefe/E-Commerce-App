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
        VStack(alignment: .leading, spacing: 0) {
            Text(Constants.profileRowInfo[0])
                .headlineBoldText
            TextField(person.name, text: $person.name).profileTextfieldEdit
        }.profileItemStackEdit
        // Phone Textfield
        VStack(alignment: .leading, spacing: 0) {
            Text(Constants.profileRowInfo[1])
                .headlineBoldText
            TextField(person.phone, text: $person.phone).profileTextfieldEdit
        }.profileItemStackEdit
        // Email Textfield
        VStack(alignment: .leading, spacing: 0) {
            Text(Constants.profileRowInfo[2])
                .headlineBoldText
            TextField(person.email, text: $person.email).profileTextfieldEdit
        }.profileItemStackEdit
        // BirthDate Textfield
        VStack(alignment: .leading, spacing: 0) {
            Text(Constants.profileRowInfo[3])
                .headlineBoldText
            TextField(person.birthDate, text: $person.birthDate).profileTextfieldEdit
        }.profileItemStackEdit
    }
}
