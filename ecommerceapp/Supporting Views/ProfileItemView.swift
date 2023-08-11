//
//  ProfileItemView.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 6.08.2023.
//

import SwiftUI

struct ProfileItemView: View {
    let person = Person.all()
    @State private var nameInput: String = ""
    @State private var phoneInput: String = ""
    @State private var emailInput: String = ""
    @State private var birthInput: String = ""
    var body: some View {
        // Full Name Textfield
        Text(Constants.profileRowInfo[0])
            .headlineBoldText
        TextField(person.name, text: $nameInput).profileTextfieldEdit
        // Phone Textfield
        Text(Constants.profileRowInfo[1])
            .headlineBoldText
        TextField(person.phone, text: $phoneInput).profileTextfieldEdit
        // Email Textfield
        Text(Constants.profileRowInfo[2])
            .headlineBoldText
        TextField(person.email, text: $emailInput).profileTextfieldEdit
        // BirthDate Textfield
        Text(Constants.profileRowInfo[3])
            .headlineBoldText
        TextField(person.birthDate, text: $birthInput).profileTextfieldEdit
    }
}
