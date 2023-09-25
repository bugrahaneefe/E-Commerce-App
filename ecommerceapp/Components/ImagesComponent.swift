//
//  ImagesComponent.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 20.09.2023.
//

import SwiftUI

struct FurnImage: View {
    var imageName: String
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(width: 94, height: 115)
            .background(
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 94, height: 115)
                    .clipped()
            )
            .cornerRadius(8)
    }
}
struct FurnItemCellImage: View {
    var imageName: String
    var body: some View {
        Image(imageName)
            .resizedImage
            .cornerRadius(5)
            .frame(width: 164, height: 200)
    }
}
struct FurnIsFavorite: View {
    var isFavorite: Bool
    var body: some View {
        Image(systemName: isFavorite ? "heart.fill" : "heart")
            .foregroundColor(isFavorite ? .red : .gray)
            .frame(width: 40, height: 40)
            .background(Color.white)
    }
}
struct TrashImage: View {
    var body: some View {
        Image(systemName: "trash")
            .foregroundColor(Color.gray)
            .frame(width: 24, height: 24)
    }
}
struct DeleteIcon: View {
    var body: some View {
        Image(systemName: "xmark.circle.fill")
            .foregroundColor(.gray)
            .padding(.top, 5)
    }
}
struct MainScreenImage: View {
    var body: some View {
        Image(Constants.CategoryImagesNames.mobomain.rawValue)
            .fillImage
    }
}
struct ProfilePhotoImage: View {
    var body: some View {
        Image(Constants.EmojiImagesNames.avatar.rawValue)
            .resizedImage
            .cornerRadiusRectangle(5)
            .frameCenter(width: 100, height: 80)
            .clipShape(Circle())
    }
}
struct SurprisedEmojiImage: View {
    var body: some View {
        Image(Constants.EmojiImagesNames.surprised.rawValue)
            .frame(width: 120, height: 120)
    }
}
