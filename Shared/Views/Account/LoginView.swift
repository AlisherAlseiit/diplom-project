//
//  LoginView.swift
//  diplom-project (iOS)
//
//  Created by Алишер Алсейт on 20.10.2021.
//

import SwiftUI

struct LoginView: View {
    //    @State var loginMode = Constants.LoginMode.login
    @State var email = ""
    @State var name = ""
    @State var password = ""
    @State var phoneNumber = ""
    @State var errorMessage: String?
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        ZStack (alignment: .topTrailing) {
            VStack(spacing: 10) {
                
                Image(systemName: "book")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 150)
                
                Text("Diploma")
                
                Picker(selection: $model.loginMode, label: Text("Hey")) {
                    
                    Text("Login")
                        .tag(Constants.LoginMode.login)
                    
                    Text("register")
                        .tag(Constants.LoginMode.creteAccount)
                    
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Group {
                    
                    if model.errorMessage != "" {
                        Text(model.errorMessage ?? "")
                            .foregroundColor(Color.red)
                        
                    }
                    TextField("Email", text: $email)
                    
                    if model.loginMode == Constants.LoginMode.creteAccount {
                        
                        
                        TextField("Name", text: $name)
                        
                        TextField("phone number", text: $phoneNumber)
                        
                    }
                    
                    SecureField("Password", text: $password)
                    
                    if errorMessage != nil {
                        Section {
                            Text(errorMessage!)
                        }
                    }
                }
                
                
                Button {
                    
                    if model.loginMode == Constants.LoginMode.login {
                        
                        model.login(email: email, password: password) { _ in
                            model.checkLogin()
                        }
                        
                    } else {
                        
                        model.register(email: email, password: password, name: name, phone: phoneNumber) { _ in
                            model.checkLogin()
                        }
                        
                    }
                    
                    
                } label: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.blue)
                            .frame(height:40)
                            .cornerRadius(10)
                        
                        Text(buttonText)
                            .foregroundColor(.white)
                    }
                }
                
                Spacer()
            }
            
            .padding(.horizontal, 40)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
//            NavigationLink {
//                OnBoardingView()
//            } label: {
//                Image(systemName: "exclamationmark")
//                    .foregroundColor(.white)
//                    .padding(.all, 15)
//                    .background(Color.purple)
//                    .clipShape(Circle())
//                    .padding(.all, 5)
//    
//            }
        }
        
    }
    
    var buttonText: String {
        
        if model.loginMode == Constants.LoginMode.login {
            return "Login"
        }
        else {
            return "Sign up"
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(ContentModel())
    }
}
