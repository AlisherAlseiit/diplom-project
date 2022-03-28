//
//  User.swift
//  diplom-project (iOS)
//
//  Created by Alish Alseiit on 21.03.2022.
//

import Foundation


struct User: Codable, Identifiable {
    
    var id: Int
    var name: String
    var email: String
    var phone: String
    var image: String?
    var card: Card
}

struct Card: Codable, Identifiable {
    var id: Int
    var name: String
    var color: String
    var discount: Int
    var min: Int
    var expires: String
    var next: Next?
    
}

struct Next: Codable, Identifiable {

    var id: Int
    var name: String
    var color: String
    var discount: Int
    var min: Int
}

