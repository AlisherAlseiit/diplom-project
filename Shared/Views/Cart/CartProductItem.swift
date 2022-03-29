//
//  CartProductItem.swift
//  diplom-project (iOS)
//
//  Created by Aurora on 05.03.2022.
//

import SwiftUI

struct CartProductItem: View {
    var cartItem: Cart
    @EnvironmentObject var model: ContentModel
    var cornerRadius: CGFloat = 5
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            VStack(spacing: 10) {
                AsyncImage(url: URL(string: cartItem.product.image)) { image in
                    image
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 55, height: 55)
                        
                } placeholder: {
                    Image("AI-92")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width:55, height: 55)
                }
                    
                
                Text("Delete")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        model.deleteFromCart(productID: cartItem.id)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        }
                    }
            }
            VStack(alignment: .leading, spacing: 10) {
                Text(cartItem.product.name)
                    .bold()
                    .font(.subheadline)
                    .foregroundColor(.primary)
                Text("$" + String(format: "%.2f", Double(cartItem.count) * cartItem.product.price))
                    .font(.subheadline)
                
            }
            Spacer()
            
            
            VStack(spacing: 10) {
                Image(systemName: "plus")
                    .padding(5)
                    .background(Circle().foregroundColor(.gray).opacity(0.2))
                    .onTapGesture {
                        model.addToCart(productID: cartItem.productId, count: 1)
                    }
                    .disabled(model.isLoading)
                
                Text("x \(cartItem.count)")
               
                   
                
                Image(systemName: "minus")
                    .padding(10)
                    .background(Circle().foregroundColor(.gray).opacity(0.2))
                    .onTapGesture {
                        if cartItem.count >= 2 {
                            model.removeItem(cartId: cartItem.id, productId: cartItem.productId, count: cartItem.count-1)
                        }
                    }
                    .disabled(model.isLoading)
            }
        }
        
    }
}

struct CartProductItem_Previews: PreviewProvider {
    static var previews: some View {
        CartProductItem(cartItem: Cart(id: 1, count: 1, productId: 1, userId: 2, product: Product(id: 1, name: "AI-92", price: 54.34, description: "some desk", image: "https://api.edev.kz/storage/products/DT.png", category: Category(id: 1, name: "Oil"))))
            .environmentObject(ContentModel())
    }
}
