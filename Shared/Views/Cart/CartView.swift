//
//  CartView.swift
//  diplom-project (iOS)
//
//  Created by Aurora on 05.03.2022.
//

import SwiftUI

struct CartView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background 6").edgesIgnoringSafeArea(.all)
                VStack {
                    List() {
                        ForEach(petroleoums) { item in
                            Section {
                                CartProductItem(course: item)
                            }
                        }
                    }
                    .listStyle(.insetGrouped)
                    Button(action: {
                        
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
    }
}
