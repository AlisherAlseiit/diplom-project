//
//  CartPriceItem.swift
//  diplom-project (iOS)
//
//  Created by Alish Alseiit on 23.03.2022.
//

import SwiftUI

struct CartPriceItem: View {
    @EnvironmentObject var model: ContentModel
    var body: some View {
        VStack(alignment: .leading) {
            Text("Order Info")
                .font(.subheadline)
                .bold()
                .padding(.vertical, 5)
            
            HStack {
                Text("Cout")
                    .foregroundColor(.secondary)
                    .font(.caption)
                Spacer()
                Text("\(model.cartTotalItemCount)")
            }
            
            HStack {
                Text("Total")
                    .foregroundColor(.secondary)
                    .font(.caption)
                Spacer()
                Text("$" + String(format: "%.2f", model.total))
            }
            
            Divider()
            HStack {
                Text("To Pay")
                    .foregroundColor(.secondary)
                    .font(.caption)
                Spacer()
                Text("$" + String(format: "%.2f", model.total-(model.total*Double(model.cartWithDiscount!.discount)/100)))
                
                
            }
        }
    }
}

struct CartPriceItem_Previews: PreviewProvider {
    static var previews: some View {
        CartPriceItem()
            .environmentObject(ContentModel())
    }
}
