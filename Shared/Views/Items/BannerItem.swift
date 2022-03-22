//
//  BannerItem.swift
//  diplom-project (iOS)
//
//  Created by Aurora on 04.03.2022.
//

import SwiftUI

struct BannerItem: View {
    var article: Article
    var cornerRadius: CGFloat = 15
    var body: some View {
            VStack (alignment: .leading) {
                HStack (alignment: .top){
                    Spacer()
                }
                
                VStack (alignment: .leading, spacing: 12){
                    Text(article.title)
                        .font(.title3)
                        .foregroundColor(Color.white)
                        .bold()
                    
                    Text(article.body)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .bold()
                        
                        
                }
                Spacer()
                
                
            }
            .padding(.top, 20)
            .padding(.all, 20)
            .background(
                AsyncImage(url: URL(string: article.image)) { image in
                    image
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Image(livestreams[0].image)
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        
                }
               
            )
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
        .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 10)
         
        
    }
}

struct BannerItem_Previews: PreviewProvider {
    static var previews: some View {
        BannerItem(article: Article(id: 1, title: "Some Title", image: "", body: "dawdw", articleId: 1))
    }
}
