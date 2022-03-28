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
    @State private var text = ""
    @State var count = 1
    var body: some View {
        ZStack(alignment: .bottom) {
            Color(.gray)
                .opacity(0.2)
                .ignoresSafeArea()
            
            VStack {
                ScrollView {
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
                                HStack(spacing: 10) {
                                    Image("Subtract")
                                        .renderingMode(.template)
                                        .foregroundColor(Color("screen3").opacity(0.7))
                                        .frame(width:25, height: 25)
                                        .onTapGesture {
                                            if count >= 2 {
                                                count = count - 1
                                            }
                                        }
                                    
                                    TextField("1", value: $count, formatter: NumberFormatter() )
                                        .keyboardType(.numberPad)
                                        .frame(width: 65)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                       
                                    
                                    Image("Plus")
                                        .renderingMode(.template)
                                        .foregroundColor(Color("screen3").opacity(0.7))
                                        .onTapGesture {
                                            count = count + 1
                                        }
                                }
                                .padding(.horizontal, 5)
                                .padding(.vertical, 2)
                                .background(RoundedRectangle(cornerRadius: 5).stroke(Color("screen3")))
                                
//                                .background(Color.gray.opacity(0.2).cornerRadius(6))
                               
                                
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
                                .lineLimit(10)
                            
                            Spacer()
                            
                            Button {
                                model.addToCart(productID: product.id, count: count)
                                count = 1
                                
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(Color("screen3"))
                                        .frame(width: getScreenBounds().width-20, height: 50)
                                    
                                    Text("Add To Cart")
                                        .foregroundColor(.white)
                                }
                            }
                            .padding(.bottom, 50)
                            
                            
                            
                        }
                        .padding(.horizontal, 20)
                    }
                    .background(
                        Color(.white)
                            .cornerRadius(40)
                            .ignoresSafeArea(.container, edges: .bottom)
                    )
                }
            }
        }
        
        
        
        
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(product: Product(id: 1, name: "AI-92", price: 156.24, description: "some desk", image: "https://api.edev.kz/storage/products/DT.png", category: Category(id: 1, name: "diesel")))
            .environmentObject(ContentModel())
    }
}
