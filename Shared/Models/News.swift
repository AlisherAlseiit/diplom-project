//
//  News.swift
//  diplom-project (iOS)
//
//  Created by Aurora on 26.02.2022.
//

import Foundation

struct News: Decodable, Identifiable {
    var id = UUID()
    var title: String
    var content: String
    var image: String
    
}


var availableNews = [
    News(title: "What is oil?", content: "Oil is a combustible oily liquid with a specific odor, common in the sedimentary shell of the Earth, which is the most important mineral. The advantages of oil and gas as energy sources include the relatively low cost of production, the possibility of waste-free processing to produce a variety of fuels and chemical raw materials.", image: ""),
    News(title: "How is oil extracted?", content: "Oil production is a process in which oil workers have to deal with enormous pressures, high temperatures, penetrate to great depths into the thickness of the earth's crust, and raise gigantic volumes of combustible explosive substances to the surface. Very powerful and massive equipment is used for this. Oil is pumped out of the bowels by pumps, but there are other ways of extraction. The most promising is the development of deposits on the seabed, in the depths of which up to 70% of its world reserves are hidden.", image: ""),
    News(title: "What is oil produced for?", content: "Oil is the most popular commodity. Oil is traded at retail, on stock exchanges and even for the future, through commodity futures. According to research, the most common products from oil belong to the types of fuel. These are diesel fuel, fuel oil, jet fuel and, of course, the most popular petroleum product among the people - gasoline. It accounts for 50% of the total volume of petroleum products produced in the world.", image: ""),
    News(title: "Standard Oil Qazaqstan", content: "The main sellers in the oil market are oil producing companies. One of them is Standard Oil Qazaqstan. The document contains the terms of reference for the development of a platform for wholesale and retail trade of petroleum products of Standard Oil Qazaqstan LLP. The company sells petroleum products. They have been actively selling since 2020 for 2 years.", image: "")
]
