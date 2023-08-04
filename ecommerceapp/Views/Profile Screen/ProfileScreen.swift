//
//  ProfileScreen.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 1.08.2023.
//

import SwiftUI

struct ProfileScreen: View {
    let person = Person.all()
    @State private var nameInput: String = ""
    @State private var phoneInput: String = ""
    @State private var emailInput: String = ""
    @State private var birthInput: String = ""

    var body: some View {
        VStack {
            navigationBarEdit(title: "My Details")
            Image("avatar")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80, alignment: .center)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Button(action: {
                    // Change photo button action
                }) {
                    Text("Change Photo").foregroundColor(.black)
                }
            }.padding(.horizontal, 5)
            Spacer()
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(alignment: .leading, spacing: 10) {
                    Text("  Full Name :")
                    TextField(person.name, text: $nameInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Text("  Phone :")
                    TextField(person.phone, text: $phoneInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Text("  E-mail :")
                    TextField(person.email, text: $emailInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Text("  Date of Birth :")
                    TextField(person.birth, text: $birthInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }.padding()
            })
        }.navigationBarBackButtonHidden(true)
    }
    
    func navigationBarEdit(title: String) -> some View {
        return HStack {
            Spacer()
            Button(action: {
            }) {
                Text("Save")
            }
            .frame(height: 30)
            .foregroundColor(.black)
        }
        .padding(.horizontal, 15)
        .frame(width: UIScreen.main.bounds.width, height: 35)
        .overlay(
            Text("My Details")
                .font(.custom("Poppins-Medium", size: 20))
                .foregroundColor(.black)
                .padding(.horizontal, 10)
            , alignment: .center)
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
