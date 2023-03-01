//
//  ProductsDetailView.swift
//  AlamofireTestProject
//
//  Created by Bhop on 28.02.2023.
//

import SwiftUI

struct ProductsDetailView: View {
    var index : Int
    @ObservedObject var pvm = ProductsViewModel()
    
    var body: some View {
        ScrollView{
            VStack{
                if !pvm.productList.isEmpty {
                    Text("\(pvm.productList[index].category)")
                        .font(.caption)
                        .frame(maxWidth:.infinity, alignment: .leading)
                        .padding(10)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing:20){
                            ForEach(pvm.productList[index].images, id: \.self){
                                image in
                                AsyncImage(url: URL(string: image)){
                                    phease in
                                    if let image = phease.image {
                                        image.resizable()
                                            .frame(width:350, height: 300, alignment: .center)
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
                            }
                        }
                    }
                    ZStack{
                        Text("\(pvm.productList[index].brand) \(pvm.productList[index].title)")
                            .font(.title)
                            .frame(maxWidth:.infinity, alignment: .leading)
                            .padding(10)
                        Text("\(pvm.productList[index].price) $")
                            .font(.title)
                            .frame(maxWidth:.infinity, alignment: .trailing)
                            .padding(10)
                    }
                    Text("Stock: \(pvm.productList[index].stock)")
                        .font(.title3)
                        .frame(maxWidth:.infinity, alignment: .leading)
                        .padding(10)
                    Divider()
                    Text("Description")
                        .font(.title3)
                        .frame(maxWidth:.infinity, alignment: .leading)
                        .padding(10)
                    Divider()
                    Text("\(pvm.productList[index].description)")
                        .font(.caption)
                        .frame(maxWidth:.infinity, alignment: .leading)
                        .padding(10)
                }
            }
        }.background(.white)
    }
}

struct ProductsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsDetailView(index: 0)
    }
}
