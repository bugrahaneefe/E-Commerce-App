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
            CategoryItemViewInCategories(categoryTitle: Constants.categoryImages[1])
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
            CategoryItemViewInCategories(categoryTitle: Constants.categoryImages[2])
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
            CategoryItemViewInCategories(categoryTitle: Constants.categoryImages[3])
        }.navigationTitle("droom".locally())
            .navigationBarBackButtonHidden(true)
            .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                DismissButton()
            }
        }
    }
}
