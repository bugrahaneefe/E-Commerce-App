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

func getCategoryInScreen(cat: CategoryInScreen) -> some View {
    switch cat {
    case .bedroom:
        return VStack {
            SortFilterView()
            CategoryItemViewInCategories(categoryTitle: Constants.categoryTitles[0])
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
            CategoryItemViewInCategories(categoryTitle: Constants.categoryTitles[1])
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
            CategoryItemViewInCategories(categoryTitle: Constants.categoryTitles[2])
        }.navigationTitle("droom".locally())
            .navigationBarBackButtonHidden(true)
            .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                DismissButton()
            }
        }
    }
}
