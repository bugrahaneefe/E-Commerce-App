//
//  CategoryScreen.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 1.08.2023.
//

import SwiftUI

struct CategoryScreen: View {
    var body: some View {
            NavigationView {
                VStack(alignment: .leading) {
                    NavigationBarEdit(title: "main.title".locally(), size: 30, height: 100)
                    VStack {
                        SliderStoryView()
                        ScrollView(.vertical, showsIndicators: false, content: {
                            VStack(spacing: 10) {
                                CategoryItemView(destination: getCategoryInScreen(cat: .bedroom),
                                                 imageName: Constants.images[1])
                                CategoryItemView(destination: getCategoryInScreen(cat: .livingroom),
                                                 imageName: Constants.images[2])
                                CategoryItemView(destination: getCategoryInScreen(cat: .dining),
                                                 imageName: Constants.images[3])
                            }.padding()
                        })
                    }.navigationBarBackButtonHidden(true)
                }
            }
    }
}

struct CategoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        CategoryScreen()
    }
}
