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
        TextField(person.name, text: $nameInput)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        // Phone Textfield
        Text(Constants.profileRowInfo[1])
            .headlineBoldText
        TextField(person.phone, text: $phoneInput)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        // Email Textfield
        Text(Constants.profileRowInfo[2])
            .headlineBoldText
        TextField(person.email, text: $emailInput)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        // BirthDate Textfield
        Text(Constants.profileRowInfo[3])
            .headlineBoldText
        TextField(person.birthDate, text: $birthInput)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }
}
