//
//  Order.swift
//  diplom-project (iOS)
//
//  Created by Alish Alseiit on 21.03.2022.
//

import Foundation


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

