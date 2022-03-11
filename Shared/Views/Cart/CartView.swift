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
                VStack {
                    List{
                        ForEach(model.cart) { cartItem in
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
                        model.setOrder()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            model.getCart()
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
            .onAppear {
                model.getCart()
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
    }
}
