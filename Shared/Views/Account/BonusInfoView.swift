//
//  BonusInfoView.swift
//  diplom-project (iOS)
//
//  Created by Alish Alseiit on 23.03.2022.
//

import SwiftUI

struct BonusInfoView: View {
    @EnvironmentObject var model: ContentModel
    var body: some View {
        VStack {
            HStack {
                Text("Bonus Card")
                    .bold()
                
                Spacer()
                Text( model.orderTotal >= 10000.0 ? "BLACK" : "ORANGE")
                    .foregroundColor(.white)
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 5).foregroundColor(model.orderTotal >= 10000.0 ? .black : .orange))
                    
            }
            .padding(.top, 10)
            
            BonusProgressView()
                
            
            HStack {
                Text("$" + String(format: "%.2f", model.orderTotal))
                    .font(.caption)
                
                Spacer()
                
                Text("$10,000")
                    .font(.caption)
            }
            .padding(.bottom, 10)
            Divider()
            
           
                
                
                
            HStack {
                
                Text("Discount")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Text(model.orderTotal >= 10000.0 ? "5%" : "3%")
                    .font(.caption)
            }
            
            HStack {
                
                Text("Expires in")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Spacer()
                Text("08.10.2023")
                    .font(.caption)
            }
            
            HStack {
                
                Text("Total amount")
                    .foregroundColor(.secondary)
                    .font(.caption)
                
                Spacer()
                
                Text("$" + String(format: "%.2f", model.orderTotal))
                    .font(.caption)
            }
            
          
            
            
        }
    }
}

struct BonusInfoView_Previews: PreviewProvider {
    static var previews: some View {
        BonusInfoView()
            .environmentObject(ContentModel())
    }
}
