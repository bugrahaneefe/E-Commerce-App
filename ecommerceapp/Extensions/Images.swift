//
//  Images.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 10.08.2023.
//

import Foundation
import SwiftUI

extension Image {
    var fillImage: some View {
            self.aspectRatio(contentMode: .fill).ignoresSafeArea()
        }
    var centerImage: some View {
        self.aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
            .padding()
    }
    var resizedImage: some View {
        self.resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
            .padding()
    }
    var fitImage: some View {
            self.resizable()
                .aspectRatio(contentMode: .fit)
    }
}
