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
                    Image(Constants.StoryImagesName.story0.rawValue)
                        .fitImage
                        .frameCenter(width: 88, height: 88)
                        .cornerRadiusRectangle(10)
                    Image(Constants.StoryImagesName.story1.rawValue)
                        .fitImage
                        .frameCenter(width: 88, height: 88)
                        .cornerRadiusRectangle(10)
                    Image(Constants.StoryImagesName.story2.rawValue)
                        .fitImage
                        .frameCenter(width: 88, height: 88)
                        .cornerRadiusRectangle(10)
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
