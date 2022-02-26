//
//  Content.swift
//  CoursesView
//
//  Created by Алишер Алсейт on 27.09.2021.
//

import SwiftUI

struct Content: Identifiable {
    var id = UUID()
    var text: String
    var font: Font
    var weight: Font.Weight
}

var contentText = [
    Content(text: "National Ocean Industries Association (NOIA) President Erik Milito believes the conclusion of the New York Bight offshore wind lease auction, which saw $4.37 billion in winning bids for six lease blocks offshore New York and New Jersey, is a testament to how bright the American offshore wind outlook is. The record-shattering interest in the New York Bight lease sale (shows) how confident developers are in the strength of the U.S. offshore wind industry as a whole,” Milito said. ”Companies continue to invest and innovate, and the regulatory regime has a firm foundation. The New York Bight is a watershed moment for American offshore wind. This should lead to thousands of new jobs and billions of dollars of investment for New York, New Jersey, and the entire U.S. supply chain, he said.", font: .body, weight: .regular),
    
   
]
