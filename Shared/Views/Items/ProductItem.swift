//
//  ProductItem.swift
//  diplom-project (iOS)
//
//  Created by Aurora on 04.03.2022.
//

import SwiftUI

struct ProductItem: View {
    
    var course: Course = petroleoums[0]
    var product: Product
    @EnvironmentObject var model: ContentModel
    @EnvironmentObject var cartModel: CartModel
    
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
                    cartModel.addToCart(productID: product.id)
                    
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
        ProductItem(product: Product(id: 1, name: "AI-95", price: 56.0, count: 13, description: "Lorem ipsum is a placeholder text", categoryId: 1))
            .environmentObject(ContentModel())
            .environmentObject(CartModel())
    }
}
