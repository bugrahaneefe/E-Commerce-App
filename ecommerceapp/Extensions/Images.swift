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
}
