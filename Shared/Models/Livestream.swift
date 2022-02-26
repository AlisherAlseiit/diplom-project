//
//  Livestream.swift
//  DesignCodeUniversal
//
//  Created by Meng To on 7/7/20.
//

import SwiftUI

struct Livestream: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var logo: String
    var show: Bool
    var appear: Bool
    var index: Double
}

var livestreams = [
    Livestream(
        title: "Crypto Investors should be prepared to lose all their money, BOE governor says",
        subtitle: "",
        text: "Sunday, 9 May 2021",
        image: "Livestream 8",
        logo: "Logo UI Design",
        show: false,
        appear: false,
        index: 0
    ),
    Livestream(
        title: "U.S. shale growth faces headwinds on costs and equipment, EOG says",
        subtitle: "",
        text: "Monday, 15 June 2021",
        image: "Livestream 7",
        logo: "Logo SwiftUI",
        show: false,
        appear: false,
        index: 0
    ),
    Livestream(
        title: "New York Bight lease sale is a watershed moment for American offshore wind",
        subtitle: "National Ocean Industries Association (NOIA) President Erik Milito believes the conclusion of the New York Bight offshore wind lease auction, which saw $4.37 billion in winning bids for six lease blocks offshore New York and New Jersey, is a testament to how bright the American offshore wind outlook is.",
        text: "Tuesday, 10 July 2021",
        image: "Livestream 8",
        logo: "Logo Figma",
        show: false,
        appear: false,
        index: 0
    ),

]
