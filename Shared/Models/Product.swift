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

struct Cart: Codable, Identifiable {
    
    var id: Int
    var count: Int
    var productId: Int
    var userId: Int
    var product: Product
    
    
    enum CodingKeys: String, CodingKey {
        case productId = "product_id"
        case userId = "user_id"
        
        case id
        case count
        case product
        
     
    }
}

struct Order: Codable, Identifiable {
    var id: Int
    var userId: Int
    var total: Double
    var createdAt: String
    var orderItems: [OrderItem]
    
    enum CodingKeys: String, CodingKey {
        
        case userId = "user_id"
        case createdAt = "created_at"
        case orderItems = "order_items"
        
        case id
        case total
    }
}


struct OrderItem: Codable, Identifiable {
    var id: Int
    var name: String
    var count: Int
    var cost: Double
    var orderId: Int
    var productId: Int
    
    enum CodingKeys: String, CodingKey {
        
        case orderId = "order_id"
        case productId = "product_id"
        
        case id
        case name
        case count
        case cost
        
    }
    
}
