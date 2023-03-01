//
//  ProductsViewModel.swift
//  AlamofireTestProject
//
//  Created by Bhop on 27.02.2023.
//

import Foundation
import Alamofire

class ProductsViewModel : ObservableObject {
    @Published var productList = [Product]()
    
    init() {
        getProducts()
    }
    
    func getProducts() {
        AF.request(Constants.URLs.productsURL, method: .get).responseDecodable(of: Products.self) { response in
            switch response.result {
            case.success(let data):
                let products = data.products
                self.productList = products
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
