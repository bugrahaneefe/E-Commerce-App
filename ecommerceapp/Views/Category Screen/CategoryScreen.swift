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
                                CategoryItemView(destination: getCategoryInScreen(categoryType: .bedroom),
                                                 imageName: Constants.CategoryImagesNames.bedroom.rawValue)
                                CategoryItemView(destination: getCategoryInScreen(categoryType: .livingroom),
                                                 imageName: Constants.CategoryImagesNames.livingroom.rawValue)
                                CategoryItemView(destination: getCategoryInScreen(categoryType: .dining),
                                                 imageName: Constants.CategoryImagesNames.dining.rawValue)
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
