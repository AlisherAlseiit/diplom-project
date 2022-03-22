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
}