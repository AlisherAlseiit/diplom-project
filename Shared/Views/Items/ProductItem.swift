//
//  ProductItem.swift
//  diplom-project (iOS)
//
//  Created by Aurora on 04.03.2022.
//

import SwiftUI

struct ProductItem: View {
    
    var product: Product
    @EnvironmentObject var model: ContentModel
    @EnvironmentObject var cartModel: CartModel
    
    var cornerRadius: CGFloat = 5
    
    var body: some View {
        VStack (alignment: .leading, spacing: 4){
            Spacer()
            
            HStack {
                Spacer()
                AsyncImage(url: URL(string: product.image)) { imag in
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
                
            Text(product.description)
                .font(.caption)
                .foregroundColor(Color.gray)
                .lineLimit(2)
            HStack {
                Text("$" + String(format: "%.2f", product.price))
                    .fontWeight(.bold)
                    
                Spacer()
                Button {
                    cartModel.addToCart(productID: product.id, count: 1)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        cartModel.getCart()
                    }
                    
                } label: {
                    Text("Add")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(RoundedRectangle(cornerRadius: 5).foregroundColor(Color("screen3")))
                    
                }

                
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
        ProductItem(product: Product(id: 1, name: "AI-92", price: 54.34, description: "some desk", image: "https://api.edev.kz/storage/products/DT.png", category: Category(id: 1, name: "Oil")))
            .environmentObject(ContentModel())
            .environmentObject(CartModel())
    }
}
