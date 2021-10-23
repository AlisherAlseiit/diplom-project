//
//  LaunchView.swift
//  diplom-project (iOS)
//
//  Created by Алишер Алсейт on 20.10.2021.
//

import SwiftUI

struct LaunchView: View {
    @EnvironmentObject var model:ContentModel
    var body: some View {
        if model.isFirstTime {
                OnBoardingView()
        }
        else if !model.isFirstTime && !model.loggedIn {

                TestLoginView()

                    .onAppear {
                        
                        // Check if the user logged in or out
                        model.checkLogin()
                    }
       
        } else {
            TabView {
                
                HomeView()
                    .tabItem {
                        Image(systemName: "rectangle")
                    }
                
                ProfileView()
                    .tabItem {
                        VStack {
                            Image(systemName: "person")
                            Text("Learn")
                        }
                    }
            }
            
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
            .environmentObject(ContentModel())
    }
}
