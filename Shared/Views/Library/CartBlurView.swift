//
//  CartBlurView.swift
//  diplom-project (iOS)
//
//  Created by Aurora on 05.03.2022.
//

import SwiftUI

struct CartBlurView: UIViewRepresentable {
    
    var style: UIBlurEffect.Style
    func makeUIView(context: Context) -> UIVisualEffectView {
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        
        return view
        
    }
    
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
    
    
}
