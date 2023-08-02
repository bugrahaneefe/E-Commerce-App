//
//  TabBar.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 1.08.2023.
//

import SwiftUI

struct TabBar: View {
    
    @State var selected = 0
    
    var body: some View {
        ZStack {
            TabView(selection: $selected) {
                CategoryScreen()
                    .tabItem {
                        Image(systemName: "house.fill")
                    }.tag(0)
                BasketScreen()
                    .tabItem {
                        Image(systemName: "cart.fill")
                    }.tag(1)
                FavoriteScreen()
                    .tabItem {
                        Image(systemName: "heart.fill")
                    }.tag(2)
                ProfileScreen()
                    .tabItem {
                        Image(systemName: "person.fill")
                    }.tag(3)
            }
        }.accentColor(Color.init(UIColor(red: 254/255, green: 228/255, blue: 64/255, alpha: 1)))
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
