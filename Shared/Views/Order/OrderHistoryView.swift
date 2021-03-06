//
//  OrderHistoryView.swift
//  diplom-project (iOS)
//
//  Created by Aurora on 10.03.2022.
//

import SwiftUI

struct OrderHistoryView: View {
    @EnvironmentObject var model: ContentModel
    var body: some View {
        ZStack {
            Color("Background 6").edgesIgnoringSafeArea(.all)
            
            List {
                ForEach(model.orders) { order in
                    Section(header: Text(convertDate(date: order.createdAt)), footer: Text("TOTAL: $" + String(format: "%.2f", order.total))) {
                        ForEach(order.orderItems) { item in
                            OrderProductItem(course: petroleoums[0], orderItem: item)
                        }
                    }
                }
            }
        }
        .onAppear {
            model.getOrders()
        }
        .navigationTitle("Orders")
        
    }
    
    func convertDate(date: String) -> String {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy HH:mm:ss"
        
        let stringDate: Date? = dateFormatter.date(from: date)
        
        return dateFormatterPrint.string(from: stringDate!)
    }
}

struct OrderHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        OrderHistoryView()
            .environmentObject(ContentModel())
    }
}
