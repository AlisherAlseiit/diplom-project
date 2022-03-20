//
//  LaunchView.swift
//  diplom-project (iOS)
//
//  Created by Алишер Алсейт on 20.10.2021.
//

import SwiftUI

struct LaunchView: View {
    
    
    
    @EnvironmentObject var model:ContentModel
    @EnvironmentObject var cartModel: CartModel
    @EnvironmentObject var orderModel: OrderModel
   
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
                        Image(systemName: "house")
                            Text("Home")
                    }
                
               
                
                HomeView()
                    .tabItem {
                        VStack {
                            Image(systemName: "chart.pie")
                            Text("Statistics")
                        }
                    }
                
                CartView()
                    .tabItem {
                        VStack {
                            Image(systemName: "cart")
                            Text("Cart")
                        }
                        
                    }
                    .badge(cartModel.cartTotalItemCount)
                
                ProfileView()
                    .tabItem {
                        VStack {
                            Image(systemName: "person")
                            Text("Profile")
                        }
                    }
            }
            .onAppear {
                UITabBar.appearance().backgroundColor = UIColor(Color("TabbarColor"))
            }
            .accentColor(Color("screen3"))
            
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
            .environmentObject(ContentModel())
            .environmentObject(CartModel())
            .environmentObject(OrderModel())
    }
}
