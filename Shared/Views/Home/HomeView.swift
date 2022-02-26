//
//  HomeView.swift
//  diplom-project (iOS)
//
//  Created by Алишер Алсейт on 20.10.2021.
//

import SwiftUI





struct HomeView: View {
    @State private var products = [Product]()
    @EnvironmentObject var model:ContentModel
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    
                }
            }
            .navigationTitle("About Us")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
