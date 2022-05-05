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
    var link: String
    
}

var firstListSections = [
    ListSection(title: "Settings", icon: "gear", link: ""),
    ListSection(title: "News", icon: "newspaper", link: ""),
    ListSection(title: "Help", icon: "questionmark.circle", link: ""),
    ListSection(title: "Order History", icon: "menucard", link: "")

]

var secondListSections = [
    ListSection(title: "Website", icon: "house", link: "https://standardoilqazaqstan.kz/#/"),
    ListSection(title: "Contacts", icon: "list.dash.header.rectangle", link: "https://standardoilqazaqstan.kz/#/contacts")
]



