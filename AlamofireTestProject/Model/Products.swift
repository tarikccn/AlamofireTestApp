//
//  Products.swift
//  AlamofireTestProject
//
//  Created by Bhop on 27.02.2023.
//

import Foundation


// MARK: - Products
struct Products: Codable, Identifiable{
    let id = UUID()
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}
