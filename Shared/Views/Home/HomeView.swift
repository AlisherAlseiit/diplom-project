//
//  HomeView.swift
//  diplom-project (iOS)
//
//  Created by Алишер Алсейт on 20.10.2021.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model:ContentModel
    var body: some View {
        ZStack {
           
            Color.green
            
            Text("Welcome to Home View")
                .font(.title)
                .foregroundColor(.white)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
