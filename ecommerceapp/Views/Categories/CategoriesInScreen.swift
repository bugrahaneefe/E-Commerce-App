//
//  CategoryInScreen.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 1.08.2023.
//

import SwiftUI

enum CategoryInScreen {
    case bedroom
    case livingroom
    case dining
}

func getCategoryInScreen(categoryType: CategoryInScreen) -> some View {
    switch categoryType {
    case .bedroom:
        return VStack {
            SortFilterView()
            CategoryItemViewInCategories(categoryTitle: Constants
                .CategoryImagesNames
                .bedroom
                .rawValue)
        }.navigationTitle("broom".locally())
            .navigationBarBackButtonHidden(true)
            .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                DismissButton()
            }
        }
    case .livingroom:
        return VStack {
            SortFilterView()
            CategoryItemViewInCategories(categoryTitle: Constants
                .CategoryImagesNames
                .livingroom
                .rawValue)
        }.navigationTitle("lroom".locally())
            .navigationBarBackButtonHidden(true)
            .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                DismissButton()
            }
        }
    case .dining:
        return VStack {
            SortFilterView()
            CategoryItemViewInCategories(categoryTitle: Constants
                .CategoryImagesNames
                .dining
                .rawValue)
        }.navigationTitle("droom".locally())
            .navigationBarBackButtonHidden(true)
            .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                DismissButton()
            }
        }
    }
}
