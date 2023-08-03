//
//  CategoryScreen.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 1.08.2023.
//

import SwiftUI

struct CategoryScreen: View {
    
    var body: some View {
            NavigationView{
                VStack(alignment: .leading){
                    
                    NavigationBarEdit(title: "MOBO")
                    MainView()
                    
                }
            }
    }
    
    func MainView() -> some View {
        VStack{
            SliderView()
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 10) {
                    
                    CategoryItemView(destination: Bedroom(), imageName: "bedroom")
                    CategoryItemView(destination: Bedroom(), imageName: "livingroom")
                    CategoryItemView(destination: Bedroom(), imageName: "dining")
                }.padding()
                
            })
            
        }.navigationBarBackButtonHidden(true)
    }
    
    func NavigationBarEdit(title: String) -> some View{
        return HStack {
            Text("")
            
        }
        .frame(width: UIScreen.main.bounds.width, height: 100)
        .overlay(
            Text(title)
                .font(.custom("Poppins-Medium", size: 30))
            , alignment: .center).background(Color(UIColor(red: 254/255, green: 228/255, blue: 64/255, alpha: 1)))
    }
    
    func SliderView() -> some View {
        return VStack(alignment: .leading, spacing: 2) {
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing: 5) {
                    
                    Image("story0")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .frame(width: 88,height: 88)
                    
                    Image("story1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .frame(width: 88,height: 88)
                    
                    Image("story2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .frame(width: 88,height: 88)
                    
                    
                }.padding()
                
            })
        }
    }
    
    struct CategoryItemView<Destination: View>: View {
        var destination: Destination
        var imageName: String
        
        var body: some View {
            VStack {
                NavigationLink(destination: destination) {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                }
            }
        }
    }
    
}





struct CategoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        CategoryScreen()
    }
}
