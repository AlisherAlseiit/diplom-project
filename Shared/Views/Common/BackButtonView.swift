//
//  BackButtonView.swift
//  diplom-project (iOS)
//
//  Created by Алишер Алсейт on 22.10.2021.
//

import SwiftUI

struct BackButtonView: View {
    var getIndex: Int = 0
    @Binding var offset: CGFloat
    var body: some View {
        Image(systemName: "chevron.backward")
            .foregroundColor(.white)
            .padding(.all, 15)
            
            
            
            .onTapGesture {
                
                offset = max(offset - getScreenBounds().width, 0)
            }
    }
}

struct BackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonView(offset: .constant(0))
    }
}
