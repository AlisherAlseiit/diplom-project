//
//  ProfileInfoItem.swift
//  diplom-project (iOS)
//
//  Created by Aurora on 04.03.2022.
//

import SwiftUI

struct ProfileInfoItem: View {
    var cornerRadius: CGFloat = 15
    var body: some View {
        VStack (alignment: .leading) {
            Spacer()
            HStack (alignment: .top){
                Spacer()
            }
            
            HStack {
                Spacer()
                VStack (alignment: .center, spacing: 12){
                    
                    Image(systemName: "person.fill")
                        .foregroundColor(.white)
                        .padding(.all, 5)
                        .background(Color("Elipse1").opacity(0.1))
                        .clipShape(Circle())
                        .padding(.all, 10)
                        .background(Color("Elipse2").opacity(0.3))
                        .clipShape(Circle())
                        
                        
                    Text("Johny Depp")
                        .font(.title3)
                        .foregroundColor(Color.black)
                        .bold()
                }
                Spacer()
            }
            Spacer()
        }
        .padding(.top, 20)
        .padding(.all, 20)
        .background(
            Image(livestreams[0].image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
        .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 10)
    }
}

struct ProfileInfoItem_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfoItem()
    }
}
