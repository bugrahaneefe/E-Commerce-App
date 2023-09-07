//
//  ProfileScreen.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 1.08.2023.
//

import SwiftUI

struct ProfileScreen: View {
    var body: some View {
        VStack {
            NavigationBarEditWSave(title: "detail".locally(), size: 20)
            Image(Constants.EmojiImagesNames.avatar.rawValue)
                .resizedImage
                .cornerRadiusRectangle(5)
                .frameCenter(width: 100, height: 80)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                ButtonWText(text: "c.photo".locally(),
                            backgroundColor: .white,
                            cornerRadius: 0,
                            fontSize: 15)
            }.padding(.horizontal, 5)
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(alignment: .leading, spacing: 10) {
                    ProfileItemView()
                }.padding()
            })
        }.navigationBarBackButtonHidden(true)
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
