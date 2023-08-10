//
//  ContentView.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 1.08.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                NavigationLink(destination: TabBar(), label: {
                    Image(Constants.categoryImages[0]).ECFillImage()
                })
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
