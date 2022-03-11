//
//  HomeView.swift
//  diplom-project (iOS)
//
//  Created by Алишер Алсейт on 20.10.2021.
//

import SwiftUI
import Lottie

struct HomeView: View {
    @State private var products = [Product]()
    @EnvironmentObject var model:ContentModel
    @State private var isPatreleoum = false
    @State private var selectedPage = 0
    let timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
            Color("Background 3").edgesIgnoringSafeArea(.all)
            
            NavigationView {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 10) {
                        
//                        BannerItem(livestream: livestreams[0])
                        TabView(selection: $selectedPage) {
                            BannerItem(livestream: livestreams[0])
                                .tag(0)
                            BannerItem(livestream: livestreams[1])
                                .tag(1)
                            BannerItem(livestream: livestreams[2])
                                .tag(2)
                        }
                        .tabViewStyle(PageTabViewStyle())
                        .frame(height: 190)
                        .cornerRadius(15)
                        .onReceive(timer) { time in
                            if selectedPage == 0 {
                                withAnimation {
                                    selectedPage = 1
                                }
                            } else if selectedPage == 1 {
                                withAnimation {
                                    selectedPage = 2
                                }
                            } else  {
                                withAnimation {
                                    selectedPage = 0
                                }
                            }
                        }
                        
                        SectionTitle(title: "Categories")
                        CategoryItems(isPetroleoum: $isPatreleoum)
                        SectionTitle(title: "Products")
                        
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 16)], spacing: 16) {
                            ForEach(isPatreleoum ? model.petroleoums : model.diesels) { item in
                                
                                    ProductItem(course: petroleoums[0], product: item)
                                   
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
