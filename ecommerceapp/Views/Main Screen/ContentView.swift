//
//  ContentView.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 1.08.2023.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    init() {
        Furnitures.setup()
    }
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                NavigationLink(destination: TabBar(), label: {
                    Image(Constants.CategoryImagesNames.mobomain.rawValue)
                        .fillImage
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
