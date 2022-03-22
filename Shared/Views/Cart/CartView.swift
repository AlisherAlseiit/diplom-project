//
//  CartView.swift
//  diplom-project (iOS)
//
//  Created by Aurora on 05.03.2022.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var model:ContentModel
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background 6").edgesIgnoringSafeArea(.all)
                if !model.cart.isEmpty {
                VStack {
                    List{
                        ForEach(model.cart) { cartItem in
                            Section {
                                CartProductItem(cartItem: cartItem)
                            }
                        }
                        
                    }
                    .listStyle(.insetGrouped)
                    
                    
                    Button(action: {
                        model.setOrder()
                    }) {
                        Text("Checkout")
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding(15)
                            .background(RoundedRectangle(cornerRadius: 12).foregroundColor(Color("screen3")))
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
                }
                } else {
                    
                    VStack(spacing: 10) {
                        Image(systemName: "cart")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text("Cart is Empty")
                            .bold()
                            .font(.headline)
                        
                    }
                }
                
                
                if model.isLoading {
                    ProgressView()
                        .padding(15)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                        )
                }
               
            }
            .navigationTitle("Cart")
        }
        .onAppear {
            UITableView.appearance().sectionFooterHeight = 7
            UITableView.appearance().sectionHeaderHeight = 7
        }
    }   
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(ContentModel())
    }
}
