//
//  LoadingView.swift
//  DesignCode
//
//  Created by Meng To on 2020-04-01.
//  Copyright © 2020 Meng To. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            LottieView(filename: "Paperplane")
                .frame(width: 200, height: 100)
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.white.opacity(0.2))
                        .background(Color("secondaryBackground")
                                        .opacity(0.5))
                        .background(VisualEffectBlur(blurStyle: .systemMaterialDark))
                        .shadow(color: Color("shadowColor").opacity(0.5), radius: 60 , x: 0, y: 30)
                )
                .cornerRadius(30)
                
           
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
