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
                            TabView(selection: $model.selectedPage) {
                                ForEach(model.articles.indices, id: \.self) { article in
                                    BannerItem(article: model.articles[article])
                                    .tag(article)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle())
                        .frame(height: 190)
                        .cornerRadius(15)
                        .onReceive(timer) { time in
                            if model.selectedPage != -1  && !model.indexes.isEmpty {
                                if model.selectedPage + 1 <= model.indexes.count-1 {
                                    withAnimation {
                                        model.selectedPage = model.selectedPage + 1
                                    }
                                } else {
                                    withAnimation {
                                        model.selectedPage = model.indexes.firstIndex(of: model.indexes.first!) ?? -1
                                    }
                                }
                            } else {
                                print("fail")
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
                        .padding(.bottom, 25)
                    }
                    .padding(.horizontal, 20)
                    
                    
                }
                
                .navigationBarItems(leading: Image("logo").renderingMode(.original))
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
