//
//  SwiftUIView.swift
//  diplom-project (iOS)
//
//  Created by Aurora on 11.03.2022.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Image(systemName: "cart")
                    .resizable()
                    .frame(width: 50, height: 50)
                Text("Cart is Empty")
                    .bold()
                    .font(.headline)
                
            }
            .navigationTitle("Cart")
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
