//
//  CartView.swift
//  diplom-project (iOS)
//
//  Created by Aurora on 05.03.2022.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var model:ContentModel
    @EnvironmentObject var cartModel: CartModel
    @EnvironmentObject var orderModel: OrderModel
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background 6").edgesIgnoringSafeArea(.all)
                if !cartModel.cart.isEmpty {
                VStack {
                    List{
                        ForEach(cartModel.cart) { cartItem in
                            Section {
                                CartProductItem(course: petroleoums[0], cartItem: cartItem)
                            }
                        }
                        .onDelete { value in
                            print("deleted: \(value)")
                        }
                    }
                    .listStyle(.insetGrouped)
                    
                    
                    Button(action: {
                        orderModel.setOrder()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            cartModel.getCart()
                        }
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
                
                
                if cartModel.isLoading {
                    ProgressView()
                        .padding(15)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                        )
                }
               
            }
            .navigationTitle("Cart")
            .onAppear {
                cartModel.getCart()
            }
        }
        .onAppear {
            UITableView.appearance().sectionFooterHeight = 7
            UITableView.appearance().sectionHeaderHeight = 7
        }
    }
    
//    func delete(at offsets: IndexSet) {
//           petroleoums.remove(at: offsets)
//       }
    
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(ContentModel())
            .environmentObject(CartModel())
            .environmentObject(OrderModel())
    }
}
