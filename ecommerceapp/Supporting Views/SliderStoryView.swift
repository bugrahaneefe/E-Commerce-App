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
                    Image(Constants.storyImages[0])
                        .ECFitImage(width: 88, height: 88)
                    Image(Constants.storyImages[1])
                        .ECFitImage(width: 88, height: 88)
                    Image(Constants.storyImages[2])
                        .ECFitImage(width: 88, height: 88)
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
