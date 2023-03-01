//
//  MainView.swift
//  AlamofireTestProject
//
//  Created by Bhop on 1.03.2023.
//

import SwiftUI

struct MainView: View {
    var index : Int
    var body: some View {
        TabView {
            ProfileView(index: index)
                .tabItem() {
                    Image("User")
                    Text("Profile")
                        .foregroundColor(.black)
                }
            
            ProductsView()
                .tabItem() {
                    Image("Home")
                    Text("Products")
                        .foregroundColor(.black)
                       
                }
        }.navigationBarBackButtonHidden(true)
            .accentColor(.black)
            .font(.title)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(index: 0)
    }
}
