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
            
                List(products) { product in
                VStack {
                    Text(product.name)
                        .font(.headline)
                    
                    HStack {
                        Text(product.description)
                            .lineLimit(1)
                            .foregroundColor(.secondary)
                        
                        Spacer()
                        Text("\(product.price)")
                            .foregroundColor(.secondary)
                    }
                }
                
            }
            
            
            
        }
        .task {
            do {
                
//                model.fetchPosts()
                let url = URL(string: "\(Constants.url)/products")

                let (data, _) = try await URLSession.shared.data(from: url!)
                
                products = try JSONDecoder().decode([Product].self, from: data)
                print(products)
            }
            catch {
                products = []
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
