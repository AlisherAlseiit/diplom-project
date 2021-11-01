//
//  Product.swift
//  diplom-project (iOS)
//
//  Created by Алишер Алсейт on 28.10.2021.
//

import SwiftUI

struct Product: Decodable, Identifiable {
    
    var id: Int
    var name: String
    var price: String
    var description: String
    var category_id: Int
    var created_at: String
    var updated_at: String
    
//    enum CodingKeys: String, CodingKey {
//
//        case categoryId = "category_id"
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//
//        case id
//        case name
//        case price
//        case description
//
//
//    }
}
