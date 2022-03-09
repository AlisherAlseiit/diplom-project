//
//  ListSection.swift
//  diplom-project (iOS)
//
//  Created by Aurora on 05.03.2022.
//

import Foundation
import Lottie
import SwiftUI

struct ListSection: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var icon: String
    
}

var firstListSections = [
    ListSection(title: "Settings", icon: "gear"),
    ListSection(title: "News", icon: "newspaper"),
    ListSection(title: "Help", icon: "questionmark.circle"),
    ListSection(title: "Order History", icon: "menucard")

]

var secondListSections = [
    ListSection(title: "Website", icon: "house"),
    ListSection(title: "Contacts", icon: "list.dash.header.rectangle")
]



