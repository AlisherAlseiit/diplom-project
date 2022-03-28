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
                Text("Count")
                    .foregroundColor(.secondary)
                    .font(.caption)
                Spacer()
                Text("\(model.cartTotalItemCount)")
            }
            if model.user!.card.discount != 0 {
            HStack {
                Text("Total")
                    .foregroundColor(.secondary)
                    .font(.caption)
                Spacer()
                Text("$" + String(format: "%.2f", model.total))
                    .strikethrough(true)
            }
            }
            
            
            Divider()
            HStack {
                Text("To Pay")
                    .foregroundColor(.secondary)
                    .font(.caption)
                Spacer()
                Text("$" + String(format: "%.2f", model.total-(model.total*Double(model.cartWithDiscount!.discount)/100)))
                
                
            }
            Button(action: {
                model.setOrder()
            }) {
                Text("Checkout")
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(15)
                    .background(RoundedRectangle(cornerRadius: 12).foregroundColor(Color("screen3")))
            }
            .buttonStyle(FlatLinkStyle())
        }
    }
}

struct CartPriceItem_Previews: PreviewProvider {
    static var previews: some View {
        CartPriceItem()
            .environmentObject(ContentModel())
    }
}
