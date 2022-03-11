//
//  Course.swift
//  DesignCodeUniversal
//
//  Created by Meng To on 6/29/20.
//

import SwiftUI

struct Course: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var subtitle: String
    var color: Color
    var image: String
    var logo: String
    var show: Bool
    var index: Double
}


var diesels = [
    Course(
        title: "H-80",
        subtitle: "Lorem ipsum is a placeholder",
        color: Color(#colorLiteral(red: 0.3150139749, green: 0, blue: 0.8982304931, alpha: 1)),
        image: "AI-92",
        logo: "Logo SwiftUI",
        show: false,
        index: -1
    ),
    Course(
        title: "D/T",
        subtitle: "Lorem ipsum is a placeholder",
        color: Color(#colorLiteral(red: 0, green: 0.7283110023, blue: 1, alpha: 1)),
        image: "AI-95",
        logo: "Logo UI Design",
        show: false,
        index: -1
    ),
    Course(
        title: "A-80",
        subtitle: "Lorem ipsum is a placeholder",
        color: Color(#colorLiteral(red: 0, green: 0.7283110023, blue: 1, alpha: 1)),
        image: "AI-92",
        logo: "Logo UI Design",
        show: false,
        index: -1
    )
]
var petroleoums = [
    Course(
        title: "AI-95",
        subtitle: "Lorem ipsum is a placeholder text",
        color: Color(#colorLiteral(red: 0, green: 0.5217629075, blue: 1, alpha: 1)),
        image: "AI-95",
        logo: "Logo UI Design",
        show: false,
        index: -1
    ),
    Course(
        title: "AI-92",
        subtitle: "Lorem ipsum is a placeholder text",
        color: Color(#colorLiteral(red: 0.3150139749, green: 0, blue: 0.8982304931, alpha: 1)),
        image: "AI-92",
        logo: "Logo SwiftUI",
        show: false,
        index: -1
    )
]
