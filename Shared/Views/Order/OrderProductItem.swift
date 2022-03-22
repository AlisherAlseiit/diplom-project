//
//  OrderProductItem.swift
//  diplom-project (iOS)
//
//  Created by Aurora on 10.03.2022.
//

import SwiftUI

struct OrderProductItem: View {
    var course: Course = petroleoums[0]
    var orderItem: OrderItem
    @EnvironmentObject var model: ContentModel
    var cornerRadius: CGFloat = 5
    
    var body: some View {
        HStack {
            Image("AI-92")
                .renderingMode(.original)
                .resizable()
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(orderItem.name)
                    .bold()
                    .font(.subheadline)
                    .foregroundColor(.primary)
                Text("\(orderItem.count) x")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 2)
                    .lineLimit(1)
            }
            Spacer()
            
            
            Text("$" + String(format: "%.2f", orderItem.cost))
                .font(.subheadline)
            
            
        }
        
        
    }
}

struct OrderProductItem_Previews: PreviewProvider {
    static var previews: some View {
        OrderProductItem(orderItem:OrderItem(id: 1, name: "AI-92", count: 1, cost: 45.31, orderId: 1, productId: 1) )
            .environmentObject(ContentModel())
    }
}
