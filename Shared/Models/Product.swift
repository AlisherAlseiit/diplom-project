//
//  Product.swift
//  diplom-project (iOS)
//
//  Created by Алишер Алсейт on 28.10.2021.
//


import Foundation

struct Product: Codable, Identifiable {
    
    var id: Int
    var name: String
    var price: Double
    var description: String
    var image: String
    var category: Category

}

struct Category: Codable, Identifiable {
    var id: Int
    var name: String
}






