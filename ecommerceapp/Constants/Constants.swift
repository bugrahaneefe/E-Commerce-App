//
//  Constants.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 6.08.2023.
//

import Foundation

struct Constants {   
    static let storyNames: [String] = [
        "story0",
        "story1",
        "story2"
    ]
    static let fontNames: [String] = [
        "Poppins-Medium",
        "Poppins-MediumItalic"
    ]
    static let personRowNames: [String] = [
        "full.name".locally(),
        "phone".locally(),
        "mail".locally(),
        "birth.date".locally()
    ]
    static let images: [String] = [
        "mobomain",
        "bedroom",
        "livingroom",
        "dining",
        "avatar",
        "surprised"
    ]
    static let categoryTitles: [String] = [
        "bedroom",
        "living",
        "dining",
        "fav".locally()
    ]
    static let filter = "filter"
    static let sort = "sort"
    static let moveToBag = "move.to.bag".locally()
    static let basket = "basket".locally()
    static let totalAmount = "total.amount".locally()
    static let total = "total.dollar".locally()
}
