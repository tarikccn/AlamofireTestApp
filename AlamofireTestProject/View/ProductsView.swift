//
//  ContentView.swift
//  AlamofireTestProject
//
//  Created by Bhop on 27.02.2023.
//

import SwiftUI

struct ProductsView: View {
    
    @ObservedObject var productsList = ProductsViewModel()
    private let adaptiveColumns =
    [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        NavigationView {
            //.edgesIgnoringSafeArea(.all)
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    
                    ForEach(productsList.productList, id: \.id) {
                        item in
                        
                        NavigationLink(destination: ProductsDetailView(index: item.id-1) ) {
                            VStack{
                                Spacer()
                                    .frame(height: UIScreen.height / 20)
                                Text(item.title)
                                    .font(.headline)
                                    .foregroundColor(.black
                                    )
                                ZStack{
                                    AsyncImage(url: URL(string: item.images[0])){
                                        phease in
                                        if let image = phease.image {
                                            image.resizable()
                                                .frame(width:150, height: 150, alignment: .center)
                                                .aspectRatio( contentMode: .fit)
                                                .cornerRadius(20)
                                                .padding(.all, 5)
                                        } else if phease.error != nil {
                                            ZStack{
                                                
                                                Text("Error")
                                            }
                                            
                                        } else {
                                            ProgressView()
                                        }
                                    }
                                    RadialGradient(gradient: Gradient(colors: [.black.opacity(0.3),.white.opacity(0.3)]), center: .center, startRadius: 2, endRadius: 500)
                                        .aspectRatio( contentMode: .fit)
                                        .cornerRadius(20)
                                        .padding(.all, 13)
                                }
                                Text("\(item.price) $")
                                    .foregroundColor(.black)
                                Text("\(item.id)")
                                    .foregroundColor(.black)
                                Divider().overlay(.black)
                            }
                        }
                    }
                }
            }.background(.white)
            
        }.navigationBarBackButtonHidden(true)
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ProductsView()
        }
    }
}

extension UIScreen {
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
    static let size = UIScreen.main.bounds.size
}
