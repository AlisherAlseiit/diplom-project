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
    @State private var isPatreleoum = false
    var body: some View {
        ZStack {
            Color("Background 3").edgesIgnoringSafeArea(.all)
            
            NavigationView {
                ScrollView {
                    VStack(spacing: 10) {
                        BannerItem(livestream: livestreams[0])
                            
                        
                        SectionTitle(title: "Categories")
                        CategoryItems(isPetroleoum: $isPatreleoum)
                        SectionTitle(title: "Products")
                        
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 16)], spacing: 16) {
                            
                            ForEach(isPatreleoum ? petroleoums : diesels) { item in
                                VStack {
                                    ProductItem(course: item)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    
                }
                
                .navigationBarItems(leading: Image("Logo Principle").renderingMode(.original), trailing: Image(systemName: "magnifyingglass").padding(.all, 5).background(Color("screen3").opacity(0.1).clipShape(RoundedRectangle(cornerRadius: 5)).padding(.all, 1)))
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
