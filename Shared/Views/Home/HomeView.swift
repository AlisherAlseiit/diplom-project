//
//  HomeView.swift
//  diplom-project (iOS)
//
//  Created by Алишер Алсейт on 20.10.2021.
//

import SwiftUI
import Lottie

struct FlatLinkStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

struct HomeView: View {
    @State private var products = [Product]()
    @EnvironmentObject var model:ContentModel
    @State private var isPatreleoum = false
    @State private var selectedPage = 6
    
    
    
    let timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
            Color("Background 3").edgesIgnoringSafeArea(.all)
            
            NavigationView {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 10) {
                        if !model.articles.isEmpty {
                        TabView(selection: $selectedPage) {
                            ForEach(model.articles) { article in
                                BannerItem(article: article)
                                    .tag(article.id)
                                
                            }
                        }
                        .tabViewStyle(PageTabViewStyle())
                        .frame(height: 190)
                        .cornerRadius(15)
                        .onReceive(timer) { time in
                            if selectedPage == 5 {
                                withAnimation {
                                    selectedPage = 6
                                }
                            } else if selectedPage == 6 {
                                withAnimation {
                                    selectedPage = 7
                                }
                            } else  {
                                withAnimation {
                                    selectedPage = 5
                                }
                            }
                        }
                        } else {
                            BannerItem(article: Article(id: 1, title: "Title", image: "https://api.edev.kz/storage/articles/mobile_slider1.png", body: "Standart oil Qazaqstan", articleId: 1))
                                .frame(height: 190)
                                .cornerRadius(15)
                        }
                        
                        SectionTitle(title: "Categories")
                        CategoryItems(isPetroleoum: $isPatreleoum)
                        SectionTitle(title: "Products")
                        
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 140), spacing: 16)], spacing: 16) {
                            ForEach(isPatreleoum ? model.petroleoums : model.diesels) { item in
                                NavigationLink {
                                    ProductView(product: item)
                                } label: {
                                    ProductItem(product: item)
                                }
                                .buttonStyle(FlatLinkStyle())
                                
                                
                                
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    
                }
                
                .navigationBarItems(leading: Image("Logo Principle").renderingMode(.original))
            }
            
            if model.isLoading {
                ProgressView()
                    .padding(15)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                    )
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
