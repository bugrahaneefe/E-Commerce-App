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
        VStack{
            VStack {
                NavigationBarEditWithoutBackground(title: "detail".locally(), size: 16, height: 32)
            }
            .frame(width: 375, height: 56)
            .background(.white.opacity(0.9))
            VStack(alignment: .center, spacing: 8) {
                Image(Constants.EmojiImagesNames.avatar.rawValue)
                    .resizedImage
                    .cornerRadiusRectangle(5)
                    .frameCenter(width: 100, height: 80)
                    .clipShape(Circle())
                ButtonWText(text: "change.photo".locally(),
                            backgroundColor: .white,
                            cornerRadius: 0,
                            fontSize: 15)
            }
            .padding(16)
            .frame(width: 375, alignment: .center)
            ScrollView(.vertical, showsIndicators: false, content: {
                if let person = person.first {
                    ProfileItemView(person: person)
                }
            })
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
