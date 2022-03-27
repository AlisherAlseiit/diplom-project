//
//  PreLaunchVIew.swift
//  diplom-project (iOS)
//
//  Created by Alish Alseiit on 22.03.2022.
//

import SwiftUI

struct PreLanuchView: View {
    @EnvironmentObject var model: ContentModel
    var body: some View {
        Group {
            if model.showLaunchView {
                LaunchView()
                
            } else {
                ZStack{
                    
                }
            }
        }
        .onAppear {
            model.checkExpirityToken()
        }
    }
}

struct PreLaunchVIew_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PreLanuchView()
                .environmentObject(ContentModel())
            PreLanuchView()
                .previewDevice("iPhone 8")
                .environmentObject(ContentModel())
            PreLanuchView()
                .previewDevice("iPod touch (7th generation)")
                .environmentObject(ContentModel())
        }
    }
}
