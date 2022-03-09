//
//  BannerItem.swift
//  diplom-project (iOS)
//
//  Created by Aurora on 04.03.2022.
//

import SwiftUI

struct BannerItem: View {
    var livestream: Livestream = livestreams[0]
    var cornerRadius: CGFloat = 15
    var body: some View {
            VStack (alignment: .leading) {
                HStack (alignment: .top){
                    Spacer()
                }
                
                VStack (alignment: .leading, spacing: 12){
                    Text(livestream.title)
                        .font(.title3)
                        .foregroundColor(Color.white)
                        .bold()
                    
                    Text(livestream.subtitle)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .opacity(0.8)
                        
                }
                Spacer()
                
                
            }
            .padding(.top, 20)
            .padding(.all, 20)
            .background(
                Image(livestream.image)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            )
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
        .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 10)
         
        
    }
}

struct BannerItem_Previews: PreviewProvider {
    static var previews: some View {
        BannerItem()
    }
}
