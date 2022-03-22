//
//  ProfileInfoItem.swift
//  diplom-project (iOS)
//
//  Created by Aurora on 04.03.2022.
//

import SwiftUI

struct ProfileInfoItem: View {
    var cornerRadius: CGFloat = 15
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        VStack (alignment: .leading) {
            Spacer()
           
            
            HStack {
                Spacer()
                VStack (spacing: 12){
                    
                    Image(systemName: "person.fill")
                        .foregroundColor(.white)
                        .padding(.all, 5)
                        .background(Color("Elipse2"))
                        .clipShape(Circle())
                        .padding(.all, 10)
                        .background(Color("Elipse1").opacity(0.3))
                        .clipShape(Circle())
                        
                        
                    Text(model.user?.name ?? "Placeholder Name")
                        .font(.title3)
                        .foregroundColor(Color.black)
                        .bold()
                Spacer()
                }
                Spacer()
            }
            Spacer()
        }
        .padding(.top, 20)
        .padding(.all, 20)
        .background(
            Color.white
//            Image(livestreams[0].image)
//                .renderingMode(.original)
//                .resizable()
//                .aspectRatio(contentMode: .fill)
        )
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
//        .shadow(radius: 1)
//        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
//        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
    }
}

struct ProfileInfoItem_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfoItem()
    }
}
