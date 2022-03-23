//
//  ProgressView.swift
//  CourseApp (iOS)
//
//  Created by Алишер Алсейт on 23.09.2021.
//

import SwiftUI

struct BonusProgressView: View {
    @EnvironmentObject var model: ContentModel
    let randomCGFloat = CGFloat.random(in: 1...100)
    var progress: CGFloat = 100.0
    var need: CGFloat = 10000.0
    var color: Color = Color("screen3")
    var background: Color = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3))
    
    
    var body: some View {
        RoundedRectangle(cornerRadius: 3)
            .frame(maxWidth: ((getScreenBounds().width-60) * (model.orderTotal/need)), maxHeight: 4)
            .foregroundColor(color)
            .mask(RoundedRectangle(cornerRadius: 3, style: .continuous))
            .frame(width: getScreenBounds().width-60, alignment: .leading)
            .padding(.all, 1)
            .background(background)
            .mask(RoundedRectangle(cornerRadius: 4, style: .continuous))
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        BonusProgressView()
            .environmentObject(ContentModel())
    }
}
