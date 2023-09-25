//
//  ProfileScreen.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 1.08.2023.
//

import SwiftUI
import RealmSwift

struct ProfileScreen: View {
    @ObservedResults(Person.self) var person
    var body: some View {
        VStack {
            VStack {
                NavigationBarEditWithoutBackground(title: "detail".locally(),
                                                   size: 16,
                                                   height: UIScreen.main.bounds.height * 0.05)
            }
            .frame(width: 375, height: 56)
            .background(.white.opacity(0.9))
            VStack(alignment: .center, spacing: 8) {
                // MARK: Profile Photo Image View
                ProfilePhotoImage()
                // MARK: Change Photo Button
                ButtonsComponent.buttonWithText(text: "change.photo".locally(),
                            backgroundColor: .white,
                            cornerRadius: 0,
                                                fontSize: 15) {
                    print("Change Photo Button is pressed!")
                }
            }
            .padding(16)
            .frame(width: UIScreen.main.bounds.width * 0.92, alignment: .center)
            ScrollView(.vertical, showsIndicators: false, content: {
                if let person = person.first {
                    ProfileItemView(person: person)
                }
            })
        }
    }
}

extension ProfileScreen {
    struct ProfileItemCell: View {
        var rowIndex: Int
        @Binding var name: String
        var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                // MARK: Profile Page Rows
                Text(Constants.profileRowInfo[rowIndex])
                    .headlineBoldText
                TextField(name, text: $name).profileTextfieldEdit
            }.profileItemStackEdit
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
