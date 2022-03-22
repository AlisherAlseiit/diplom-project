//
//  Article.swift
//  diplom-project (iOS)
//
//  Created by Alish Alseiit on 21.03.2022.
//

import Foundation


struct Article: Codable, Identifiable {
    
    var id: Int
    var title: String
    var image: String
    var body: String
    var articleId: Int

    enum CodingKeys: String, CodingKey {
        case articleId = "article_type_id"
       
        case id
        case title
        case image
        case body
        
        
    }
}



