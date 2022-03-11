//
//  CartProductItem.swift
//  diplom-project (iOS)
//
//  Created by Aurora on 05.03.2022.
//

import SwiftUI

struct CartProductItem: View {
    var course: Course = petroleoums[0]
    var cartItem: Cart
    @EnvironmentObject var model: ContentModel
    var cornerRadius: CGFloat = 5
    
    var body: some View {
        HStack {
            Image("AI-92")
                .renderingMode(.original)
                .resizable()
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(cartItem.product.name)
                    .bold()
                    .font(.subheadline)
                    .foregroundColor(.primary)
                Text(cartItem.product.description)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 2)
                    .lineLimit(1)
            }
            Spacer()
            
            VStack(spacing: 10) {
                Button {
                    model.deleteFromCart(productID: cartItem.id)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        model.getCart()
                    }
                    
                } label: {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                }

                
                Text("$" + String(format: "%.2f", cartItem.product.price))
                    .font(.subheadline)
            }
            
        }
        
        
    }
}

struct CartProductItem_Previews: PreviewProvider {
    static var previews: some View {
        CartProductItem(cartItem: Cart(id: 1, count: 1, productId: 1, userId: 2, product: Product(id: 2, name: "AI-92", price: 56.6, count: 1, description: "Lorem ipsum", categoryId: 2)))
            .environmentObject(ContentModel())
    }
}
