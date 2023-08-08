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
        TextViewHeadlinePp(textname: Constants.personRowNames[0])
        TextField(person.name, text: $nameInput)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        TextViewHeadlinePp(textname: Constants.personRowNames[1])
        TextField(person.phone, text: $phoneInput)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        TextViewHeadlinePp(textname: Constants.personRowNames[2])
        TextField(person.email, text: $emailInput)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        TextViewHeadlinePp(textname: Constants.personRowNames[3])
        TextField(person.birth, text: $birthInput)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }
}
