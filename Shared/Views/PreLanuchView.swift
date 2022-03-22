//
//  PreLaunchVIew.swift
//  diplom-project (iOS)
//
//  Created by Alish Alseiit on 22.03.2022.
//

import SwiftUI

struct PreLanuchView: View {
    @State private var showLaunchView = false
    @EnvironmentObject var model: ContentModel
    var body: some View {
        Group {
            if showLaunchView {
                LaunchView()
            } else {
                ZStack {
                    
                }
            }
        }
        .onAppear {
            model.checkExpirityToken()
            withAnimation() {
                showLaunchView = true
            }
        }
    }
}

struct PreLaunchVIew_Previews: PreviewProvider {
    static var previews: some View {
        PreLanuchView()
            .environmentObject(ContentModel())
    }
}
