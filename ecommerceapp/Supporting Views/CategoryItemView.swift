//
//  CategoryItemView.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 6.08.2023.
//

import SwiftUI

struct CategoryItemView<Destination: View>: View {
    var destination: Destination
    var imageName: String
    var body: some View {
        VStack {
            NavigationLink(destination: destination) {
                Image(imageName)
                    .fitImage
                    .cornerRadiusRectangle(10)
                    .frameCenter()
            }
        }
    }
}
