//
//  Constants.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 6.08.2023.
//

import Foundation
import SwiftUI

struct Constants {
    enum StoryImagesName: String {
        case story0
        case story1
        case story2
    }
    enum FontNames: String {
        case poppinsMed = "Poppins-Medium"
        case poppinsMedItalic = "Poppins-MediumItalic"
    }
    enum CategoryImagesNames: String {
        case mobomain
        case bedroom
        case livingroom
        case dining
    }
    enum EmojiImagesNames: String {
        case avatar
        case surprised
    }
    static let profileRowInfo: [String] = [
        "full.name".locally(),
        "phone".locally(),
        "mail".locally(),
        "birth.date".locally()
    ]
    static let filter = "filter"
    static let sort = "sort"
    static let favorite = "fav".locally()
    static let moveToBag = "move.to.bag".locally()
    static let buyIt = "buy.it".locally()
    static let basket = "basket".locally()
    static let totalAmount = "total.amount".locally()
    static let total = "total.dollar".locally()
}
