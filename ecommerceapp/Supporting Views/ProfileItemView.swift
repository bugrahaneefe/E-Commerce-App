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
        }.padding(.horizontal, 16)
            .padding(.vertical, 0)
            .frame(width: 343, height: 90, alignment: .leading)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(8)
        // Phone Textfield
        VStack(alignment: .leading, spacing: 0) {
            Text(Constants.profileRowInfo[1])
                .headlineBoldText
            TextField(person.phone, text: $person.phone).profileTextfieldEdit
        }.padding(.horizontal, 16)
            .padding(.vertical, 0)
            .frame(width: 343, height: 90, alignment: .leading)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(8)
        // Email Textfield
        VStack(alignment: .leading, spacing: 0) {
            Text(Constants.profileRowInfo[2])
                .headlineBoldText
            TextField(person.email, text: $person.email).profileTextfieldEdit
        }.padding(.horizontal, 16)
            .padding(.vertical, 0)
            .frame(width: 343, height: 90, alignment: .leading)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(8)
        // BirthDate Textfield
        VStack(alignment: .leading, spacing: 0) {
            Text(Constants.profileRowInfo[3])
                .headlineBoldText
            TextField(person.birthDate, text: $person.birthDate).profileTextfieldEdit
        }.padding(.horizontal, 16)
            .padding(.vertical, 0)
            .frame(width: 343, height: 90, alignment: .leading)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(8)
    }
}
