//
//  Components.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 20.09.2023.
//

import SwiftUI

// MARK: BUTTONS
struct StepperButtonElements: View {
    var imageName: String
    var body: some View {
        Image(systemName: imageName)
            .foregroundColor(.black)
    }
}
// MARK: IMAGES
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
