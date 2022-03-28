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
                if !model.carts.isEmpty {
                VStack {
                    List{
                        ForEach(model.carts) { cartItem in
                            Section {
                                CartProductItem(cartItem: cartItem)
                            }
                        }
                        Section {
                        CartPriceItem()
                            
                           
                            
                        }
                        
                    }
                    .listStyle(.insetGrouped)
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
            UITableView.appearance().sectionFooterHeight = 5
            UITableView.appearance().sectionHeaderHeight = 5
        }
    }   
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(ContentModel())
    }
}
