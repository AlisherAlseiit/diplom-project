//
//  ProductView.swift
//  diplom-project (iOS)
//
//  Created by Alish Alseiit on 20.03.2022.
//

import SwiftUI

struct ProductView: View {
    var product: Product
    @EnvironmentObject var model: ContentModel
    @EnvironmentObject var cartModel: CartModel
    @State var count = 1
    var body: some View {
        ZStack {
            Color(.gray)
                .opacity(0.2)
                .ignoresSafeArea()
            
            VStack {
                
                AsyncImage(url: URL(string: product.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Image("AI-92")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(height: getScreenBounds().height / 3)
                
                
                VStack(alignment: .leading){
                    VStack(alignment: .leading, spacing: 8) {
                        Text(product.name)
                            .font(.title3)
                            .bold()
                            .padding(.top, 15)
                        
                        Text(product.category.name)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        HStack {
                            HStack(spacing: 50) {
                                Image(systemName: "minus")
                                    .onTapGesture {
                                        if count >= 2 {
                                            count = count - 1
                                        }
                                    }
                                
                                Text("\(count)")
                                
                                Image(systemName: "plus")
                                    .onTapGesture {
                                        count = count + 1
                                    }
                            }
                            .padding(10)
                            .background(Color.gray.opacity(0.2).cornerRadius(6))
                            
                            Spacer()
                            
                            Text("$" + String(format: "%.2f", product.price * Double(count)))
                                .font(.title)
                                .bold()
                        }
                        
                    }
                    .padding(.horizontal, 20)
                    
                    Divider()
                        .frame(width: getScreenBounds().width)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Description")
                            .font(.headline)
                            .padding(.top, 8)
                        
                        Text(product.description)
                            .foregroundColor(.secondary)
                        
                        Spacer()
                        
                        Button {
                            cartModel.addToCart(productID: product.id, count: count)
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                cartModel.getCart()
                            }
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color("screen3"))
                                    .frame(width: getScreenBounds().width-20, height: 50)
                                
                                Text("Add To Cart")
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.bottom, 10)
                        
                        
                        
                    }
                    .padding(.horizontal, 20)
                    
                    
                    
                }
                .background(
                    Color(.white)
                        .cornerRadius(40)
                        .ignoresSafeArea(.container, edges: .bottom)
                )
                
                
                
            }
            
            
            .onAppear {
                
            }
        }
        
        
        
        
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(product: Product(id: 1, name: "AI-92", price: 156.24, description: "some desk", image: "https://api.edev.kz/storage/products/DT.png", category: Category(id: 1, name: "diesel")))
            .environmentObject(ContentModel())
            .environmentObject(CartModel())
    }
}
