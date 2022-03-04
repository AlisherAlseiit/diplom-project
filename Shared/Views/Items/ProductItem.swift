//
//  ProductItem.swift
//  diplom-project (iOS)
//
//  Created by Aurora on 04.03.2022.
//

import SwiftUI

struct ProductItem: View {
    
    var course: Course = petroleoums[0]
    
    var cornerRadius: CGFloat = 5
    
    var body: some View {
        VStack (alignment: .leading, spacing: 4){
            Spacer()
            
            HStack {
                Spacer()
                Image(course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)

                Spacer()
            }
            
            Text(course.title)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                
            Text(course.subtitle)
                .font(.caption)
                .foregroundColor(Color.gray)
            
            Text("Add to Cart")
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(5)
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color("screen3")))
        }
        .padding(.all)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        .shadow(radius:1)
    }
}

struct ProductItem_Previews: PreviewProvider {
    static var previews: some View {
        ProductItem()
    }
}
