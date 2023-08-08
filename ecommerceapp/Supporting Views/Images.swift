//
//  Images.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 6.08.2023.
//

import SwiftUI

struct ImageMainView: View {
    var imagename: String
    var body: some View {
        Image(imagename)
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
    }
}

struct ImageCenterView: View {
    var imagename: String
    var body: some View {
        Image(imagename)
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
            .frame(width: 135, height: 180)
            .padding()
    }
}

struct ImageSystemView: View {
    var imagename: String
    var body: some View {
        Image(systemName: imagename)
    }
}

struct ImageView: View {
    var imagename: String
    var body: some View {
        Image(imagename)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
            .frame(width: 90, height: 120)
            .cornerRadius(1)
            .padding()
    }
}

struct ImageCategoryView: View {
    var imagename: String
    var body: some View {
        Image(imagename)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
    }
}
