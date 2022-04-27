//
//  ProductItem.swift
//  diplom-project (iOS)
//
//  Created by Aurora on 04.03.2022.
//

import SwiftUI
import CachedAsyncImage

struct ProductItem: View {
    
    var product: Product
    @EnvironmentObject var model: ContentModel
    var cornerRadius: CGFloat = 5
    
    var body: some View {
        VStack (alignment: .leading, spacing: 4){
            Spacer()
            
            HStack {
                Spacer()
                CachedAsyncImage(url: URL(string: product.image)) { imag in
                    imag.resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Image("AI-92")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                               
                }
                Spacer()
            }
            
            Text(product.name)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                
            Text("$" + String(format: "%.2f", product.price))
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Button {
                model.addToCart(productID: product.id, count: 1)
            } label: {
                Text("Add")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding(.vertical, 5)
                    .background(RoundedRectangle(cornerRadius: 5).foregroundColor(Color("screen3")))
            }
        }
        .padding(.all)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        .shadow(radius:1)
    }
}

struct ProductItem_Previews: PreviewProvider {
    static var previews: some View {
        ProductItem(product: Product(id: 1, name: "AI-92", price: 154.34, description: "some desk", image: "https://api.edev.kz/storage/products/DT.png", category: Category(id: 1, name: "Oil")))
            .environmentObject(ContentModel())
    }
}
