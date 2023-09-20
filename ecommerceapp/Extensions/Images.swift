//
//  Images.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 10.08.2023.
//

import SwiftUI

extension Image {
    var fillImage: some View {
        self.aspectRatio(contentMode: .fill)
    }
    var centerImage: some View {
        self.aspectRatio(contentMode: .fill)
            .padding()
            .frame(alignment: .center)
    }
    var resizedImage: some View {
        self.resizable()
            .aspectRatio(contentMode: .fill)
            .padding()
    }
    var fitImage: some View {
        self.resizable()
            .aspectRatio(contentMode: .fit)
    }
    static let trashImage: some View = {
        Image(systemName: "trash")
            .foregroundColor(Color.gray)
            .frame(width: 24, height: 24)
    }()
    static let deleteIcon: some View = {
        Image(systemName: "xmark.circle.fill")
            .foregroundColor(.gray)
            .padding(.top, 5)
    }()
    static let mainScreen: some View = {
        Image(Constants.CategoryImagesNames.mobomain.rawValue)
            .fillImage
    }()
    static let profilePhoto: some View = {
        Image(Constants.EmojiImagesNames.avatar.rawValue)
            .resizedImage
            .cornerRadiusRectangle(5)
            .frameCenter(width: 100, height: 80)
            .clipShape(Circle())
    }()
    static let surprisedEmoji: some View = {
        Image(Constants.EmojiImagesNames.surprised.rawValue)
            .frame(width: 120, height: 120)
    }()
}
