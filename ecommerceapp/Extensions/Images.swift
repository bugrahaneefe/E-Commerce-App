//
//  Images.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 10.08.2023.
//

import Foundation
import SwiftUI

extension Image {
    func ECFillImage() -> some View {
        self.aspectRatio(contentMode: .fill).ignoresSafeArea()
    }
    func ECCenterImage() -> some View {
        self.aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
            .frame(width: 135, height: 180, alignment: .center)
            .padding()
    }
    func ECResizedImage(cornerRadius: Double) -> some View {
        self.resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
            .frame(width: 90, height: 120)
            .cornerRadius(cornerRadius)
            .padding()
    }
    func ECFitImage(width: CGFloat? = nil, height: CGFloat? = nil) -> some View {
            self.resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .frame(width: width, height: height)
    }
}
