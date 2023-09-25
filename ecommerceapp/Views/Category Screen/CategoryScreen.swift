//
//  CategoryScreen.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 1.08.2023.
//

import SwiftUI

struct CategoryScreen: View {
    @State private var sortingKeyPath: String = "id"
    @State private var isAscending: Bool = false
    @State var maxRating: Int = 5
    @State var minRating: Int = 0
    @State var maxPrice: Int = 10000
    @State var minPrice: Int = 0
    var body: some View {
            NavigationView {
                VStack {
                    NavigationBarMainEdit(title: "main.title".locally(),
                                          size: 32,
                                          height: UIScreen.main.bounds.height * 0.15)
                    VStack {
                        SliderStoryView()
                        ScrollView(.vertical, showsIndicators: false, content: {
                            VStack(spacing: 10) {
                                CategoryItemView(destination: getCategoryInScreen(categoryType: .bedroom,
                                                                                  sortingKeyPath: $sortingKeyPath,
                                                                                  isAscending: $isAscending,
                                                                                 maxRating: $maxRating,
                                                                                 minRating: $minRating,
                                                                                 maxPrice: $maxPrice,
                                                                                 minPrice: $minPrice),
                                                 imageName: Constants.CategoryImagesNames.bedroom.rawValue)
                                CategoryItemView(destination: getCategoryInScreen(categoryType: .livingroom,
                                                                                  sortingKeyPath: $sortingKeyPath,
                                                                                  isAscending: $isAscending,
                                                                                  maxRating: $maxRating,
                                                                                  minRating: $minRating,
                                                                                  maxPrice: $maxPrice,
                                                                                  minPrice: $minPrice),
                                                 imageName: Constants.CategoryImagesNames.livingroom.rawValue)
                                CategoryItemView(destination: getCategoryInScreen(categoryType: .dining,
                                                                                  sortingKeyPath: $sortingKeyPath,
                                                                                  isAscending: $isAscending,
                                                                                  maxRating: $maxRating,
                                                                                  minRating: $minRating,
                                                                                  maxPrice: $maxPrice,
                                                                                  minPrice: $minPrice),
                                                 imageName: Constants.CategoryImagesNames.dining.rawValue)
                            }.padding()
                        })
                    }.navigationBarBackButtonHidden(true)
                }
            }
    }
}
