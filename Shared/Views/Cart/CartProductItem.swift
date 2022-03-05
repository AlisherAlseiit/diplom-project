//
//  CartProductItem.swift
//  diplom-project (iOS)
//
//  Created by Aurora on 05.03.2022.
//

import SwiftUI

struct CartProductItem: View {
    var course: Course = petroleoums[0]
    
    var cornerRadius: CGFloat = 5
    
    var body: some View {
        HStack {
            Image(course.image)
                .renderingMode(.original)
                .resizable()
                .frame(width: 48, height: 48)
                .padding(5)
                .background(RoundedRectangle(cornerRadius: 12, style: .continuous).fill(Color("screen3")))
            VStack(alignment: .leading, spacing: 4) {
                Text(course.title)
                    .bold()
                    .font(.subheadline)
                    .foregroundColor(.primary)
                Text(course.subtitle)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 2)
            }
            Spacer()
            Image(systemName: "trash")
                .foregroundColor(.red)

            }


    }
}

struct CartProductItem_Previews: PreviewProvider {
    static var previews: some View {
        CartProductItem()
    }
}
