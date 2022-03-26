//
//  Cart.swift
//  diplom-project (iOS)
//
//  Created by Alish Alseiit on 21.03.2022.
//

import Foundation




struct Discount: Codable {
        
    var carts: [Cart]?
    var discount: Int
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
