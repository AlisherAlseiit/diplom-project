//
//  BonusInfoView.swift
//  diplom-project (iOS)
//
//  Created by Alish Alseiit on 23.03.2022.
//

import SwiftUI

extension UIColor {
    convenience init(hexaString: String, alpha: CGFloat = 1) {
        let chars = Array(hexaString.dropFirst())
        self.init(red:   .init(strtoul(String(chars[0...1]),nil,16))/255,
                  green: .init(strtoul(String(chars[2...3]),nil,16))/255,
                  blue:  .init(strtoul(String(chars[4...5]),nil,16))/255,
                  alpha: alpha)}
}

struct BonusInfoView: View {
    @EnvironmentObject var model: ContentModel
    var card: Card
    var body: some View {
        VStack {
            HStack {
                Text("Bonus Card")
                    .bold()
                
                Spacer()
                Text(card.name)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 5).foregroundColor(Color(uiColor: UIColor(hexaString: card.color))))
                
            }
            .padding(.top, 10)
            
            if card.min > 0 {
                BonusProgressView(need: CGFloat(card.min))
                
                
                
                HStack {
                    Text("$" + String(format: "%.2f", model.orderTotal))
                        .font(.caption)
                    
                    Spacer()
                    
                    Text("\(card.min)")
                        .font(.caption)
                }
                .padding(.bottom, 10)
                
            }
            Divider()
            
            
            
            
            
            HStack {
                
                Text("Discount")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Text("\(card.discount)%")
                    .font(.caption)
            }
            
            HStack {
                
                Text("Expires in")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Spacer()
                Text(card.expires)
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
        BonusInfoView(card: Card(id: 1, name: "Silver", color: "#C0C0C0", discount: 3, min: 0, expires: "2023-03-26 17:14:58"))
            .environmentObject(ContentModel())
    }
}
