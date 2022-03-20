//
//  CategoryItems.swift
//  diplom-project (iOS)
//
//  Created by Aurora on 04.03.2022.
//

import SwiftUI

struct CategoryItems: View {
    @Binding var isPetroleoum:Bool
    var cornerRadius: CGFloat = 5
    var body: some View {
        HStack {
            Text("Oil Products")
                .foregroundColor(isPetroleoum ? Color("screen3") : Color(.gray))
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(15)
                .background(RoundedRectangle(cornerRadius: cornerRadius).strokeBorder(isPetroleoum ? Color("screen3") : Color(.gray)))
                .onTapGesture {
                    isPetroleoum = true
                }
            
            
            Text("Diesel fuels")
                .foregroundColor(!isPetroleoum ? Color("screen3") : Color(.gray))
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(15)
                .background(RoundedRectangle(cornerRadius: cornerRadius).strokeBorder(!isPetroleoum ? Color("screen3") : Color(.gray)))
                .onTapGesture {
                    isPetroleoum = false
                }
        }
    }
}

struct CategoryItems_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItems(isPetroleoum: .constant(false))
    }
}
