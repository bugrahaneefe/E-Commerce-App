//
//  sliderStoryView.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 6.08.2023.
//

import SwiftUI

struct SliderStoryView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing: 5) {
                    ImageCategoryView(imagename: Constants.storyNames[0])
                        .frame(width: 88, height: 88)
                    ImageCategoryView(imagename: Constants.storyNames[1])
                        .frame(width: 88, height: 88)
                    ImageCategoryView(imagename: Constants.storyNames[2])
                        .frame(width: 88, height: 88)
                }.padding()
            })
        }
    }
}

struct SliderStoryView_Previews: PreviewProvider {
    static var previews: some View {
        SliderStoryView()
    }
}
