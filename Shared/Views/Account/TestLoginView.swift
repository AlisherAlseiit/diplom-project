//
//  TestLoginView.swift
//  diplom-project (iOS)
//
//  Created by Алишер Алсейт on 23.10.2021.
//

import SwiftUI

struct TestLoginView: View {
    
    enum Field {
        case email
        case name
        case phoneNumber
        case password
        case confirmPassword
    }
    
    @State private var fadeToggle: Bool = true
    @State private var signupToggle: Bool = true
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var phoneNumber = ""
    @State private var name = ""
    @State private var confirmPassword = ""
    @State private var rotationAngle = 0.0
    @State private var showAlert = false
    @EnvironmentObject var model: ContentModel
    @State private var showingSheet = false
    @FocusState private var focusedField: Field?
    @State var isLoading = false
    
    @ViewBuilder
    var body: some View {
        
        ZStack {
            
            general
            
            onBoarding
            
            forgotPasswordView
            
            
            
        }
        
    }
    
    @ViewBuilder
    var forgotPasswordView: some View {
        
        if model.showForgotPasswordView {
            ZStack {
                ForgotPasswordView()
                
                VStack {
                    HStack {
                        Spacer()
                        
                        Image(systemName: "xmark")
                            .frame(width: 36, height: 36)
                            .foregroundColor(.white)
                            .background(Color("secondaryBackground")
                                            .opacity(0.5))
                            .background(VisualEffectBlur(blurStyle: .systemMaterialDark))
                            .clipShape(Circle())
                    }
                    Spacer()
                }
                .padding(20)
                .padding(.top, 20)
                .onTapGesture {
                    model.showForgotPasswordView = false
                    model.forgotPasswordMode = Constants.ForgotPasswordMode.forgotPassword
                }
            }
        }
    }
    
    @ViewBuilder
    var onBoarding: some View {
        
        if model.excltapped {
            OnBoardingView()
        }
    }
    
    var general: some View {
        ZStack {
            
            Image(model.loginMode == Constants.LoginMode.creteAccount ? "background-3" : "background-1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .opacity(fadeToggle ? 1.0 : 0.0)
            
            Color("secondaryBackground")
                .edgesIgnoringSafeArea(.all)
                .opacity(fadeToggle ? 0.0 : 1.0)
            
            VStack {
                VStack(alignment: .leading, spacing: 16){
                    HStack {
                        Text(model.loginMode == Constants.LoginMode.creteAccount ? "Sign up" : "Sign In")
                            .font(Font.largeTitle.bold())
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        TextFieldIcon(iconName: "exclamationmark")
                            .onTapGesture {
                                model.excltapped = true
                                
                            }
                        
                        
                        
                    }
                    
                    HStack(spacing: 15) {
                        TextFieldIcon(iconName: "envelope.open.fill")
                        
                        TextField("Email", text: $email)
                            .focused($focusedField, equals: .email)
                            .colorScheme(.dark)
                            .foregroundColor(Color.white.opacity(0.7))
                            .submitLabel(.next)
                            .autocapitalization(.none)
                        
                    }
                    .frame(height: 52)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.white,
                                    lineWidth: 1)
                            .blendMode(.overlay)
                    )
                    .background(
                        Color("secondaryBackground")
                            .cornerRadius(16)
                            .opacity(0.8)
                    )
                    
                    if model.loginMode == Constants.LoginMode.creteAccount {
                        HStack(spacing: 15) {
                            TextFieldIcon(iconName: "person.fill")
                            
                            TextField("Name", text: $name)
                                .focused($focusedField, equals: .name)
                                .colorScheme(.dark)
                                .foregroundColor(Color.white.opacity(0.7))
                                .submitLabel(.next)
                                .autocapitalization(.none)
                            
                        }
                        .frame(height: 52)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white,
                                        lineWidth: 1)
                                .blendMode(.overlay)
                        )
                        .background(
                            Color("secondaryBackground")
                                .cornerRadius(16)
                                .opacity(0.8)
                        )
                        
                        HStack(spacing: 15) {
                            TextFieldIcon(iconName: "phone.fill")
                            
                            TextField("phone number", text: $phoneNumber)
                                .focused($focusedField, equals: .phoneNumber)
                                .colorScheme(.dark)
                                .foregroundColor(Color.white.opacity(0.7))
                                .submitLabel(.next)
                                .keyboardType(.decimalPad)
                            
                            
                        }
                        .frame(height: 52)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white,
                                        lineWidth: 1)
                                .blendMode(.overlay)
                        )
                        .background(
                            Color("secondaryBackground")
                                .cornerRadius(16)
                                .opacity(0.8)
                        )
                    }
                    
                    HStack(spacing: 15) {
                        TextFieldIcon(iconName: "key.fill")
                        
                        SecureField("Password", text: $password)
                            .focused($focusedField, equals: .password)
                            .colorScheme(.dark)
                            .foregroundColor(Color.white.opacity(0.7))
                            .autocapitalization(.none)
                            .textContentType(.password)
                            .submitLabel(model.loginMode == Constants.LoginMode.login ? .join : .next)
                            .autocapitalization(.none)
                    }
                    .frame(height: 52)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.white,
                                    lineWidth: 1)
                            .blendMode(.overlay)
                    )
                    .background(
                        Color("secondaryBackground")
                            .cornerRadius(16)
                            .opacity(0.8)
                    )
                    
                    if model.loginMode == Constants.LoginMode.creteAccount {
                        HStack(spacing: 15) {
                            TextFieldIcon(iconName: "lock.fill")
                            
                            SecureField("Confirm Password", text: $confirmPassword)
                                .focused($focusedField, equals: .confirmPassword)
                                .colorScheme(.dark)
                                .foregroundColor(Color.white.opacity(0.7))
                                .autocapitalization(.none)
                                .textContentType(.password)
                                .submitLabel(.join)
                                .autocapitalization(.none)
                        }
                        .frame(height: 52)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white,
                                        lineWidth: 1)
                                .blendMode(.overlay)
                        )
                        .background(
                            Color("secondaryBackground")
                                .cornerRadius(16)
                                .opacity(0.8)
                        )
                    }
                    
                    
                    GradientButton(buttonTitle: model.loginMode == Constants.LoginMode.creteAccount ? "Create Account" : "Sign in") {
                        
                        if model.loginMode == Constants.LoginMode.login {
                            self.isLoading = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                            model.login(email: email, password: password) { message in
                                isLoading = false
                                if message == "fail" {
                                    showAlert = true
                                    
                                } else if message == "success" {
                                    
                                    model.checkLogin()
                                }
                            }
                            }
                            
                        } else {
                            self.isLoading = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                            model.register(email: email, password: password, name: name, phone: phoneNumber, confirmPassword: confirmPassword) { _ in
                                isLoading = false
                                model.checkLogin()
                            }
                        }
                            
                        }
                        
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Error"), message: Text(model.errorMessage), dismissButton: .default(Text("OK")))
                    }
                    
                    if  model.loginMode == Constants.LoginMode.creteAccount {
                        Text("By clicking on Sign up, you agree to our Terms of service and Privacy policy")
                            .font(.footnote)
                            .foregroundColor(Color.white.opacity(0.7))
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color.white.opacity(0.1))
                        
                    }
                    
                    VStack(alignment: .leading, spacing: 16, content: {
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.35)) {
                                fadeToggle.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                                    withAnimation(.easeInOut(duration: 0.35)) {
                                        self.fadeToggle.toggle()
                                    }
                                }
                            }
                            
                            withAnimation(.easeInOut(duration:0.7)){
                                
                                if model.loginMode == Constants.LoginMode.creteAccount {
                                    model.loginMode = Constants.LoginMode.login
                                } else {
                                    model.loginMode = Constants.LoginMode.creteAccount
                                }
                                self.rotationAngle += 180
                                
                            }
                        }, label: {
                            HStack(spacing: 4) {
                                Text( model.loginMode == Constants.LoginMode.creteAccount ? "Already have an account?" : "Don't have an account?")
                                    .font(.footnote)
                                    .foregroundColor(Color.white.opacity(0.7))
                                GradientText(text:  model.loginMode == Constants.LoginMode.creteAccount ? "Sign in" : "Sign up")
                                    .font(Font.footnote.bold())
                                
                            }
                        })
                        
                        if model.loginMode == Constants.LoginMode.login {
                            Button(action: {
                                model.showForgotPasswordView = true
                            }, label: {
                                HStack(spacing: 4) {
                                    Text("Forgot password?")
                                        .font(.footnote)
                                        .foregroundColor(.white.opacity(0.7))
                                    
                                    GradientText(text: "Reset password")
                                        .font(.footnote.bold())
                                }
                            })
                            
                            
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.white.opacity(0.1))
                            
                            
                        }
                    })
                    
                }
                .padding(20)
            }
            .onSubmit {
                if model.loginMode == Constants.LoginMode.creteAccount {
                    switch focusedField {
                    case .email:
                        focusedField = .name
                    case .name:
                        focusedField = .phoneNumber
                    case .phoneNumber:
                        focusedField = .password
                    default:
                        print("")
                    }
                } else {
                    switch focusedField {
                    case .email:
                        focusedField = .password
                    default:
                        print("")
                    }
                }
            }
            .rotation3DEffect(
                Angle(degrees: self.rotationAngle),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.white.opacity(0.2))
                    .background(Color("secondaryBackground")
                                    .opacity(0.5))
                    .background(VisualEffectBlur(blurStyle: .systemMaterialDark))
                    .shadow(color: Color("shadowColor").opacity(0.5), radius: 60 , x: 0, y: 30)
            )
            .cornerRadius(30.0)
            .padding(.horizontal)
            .rotation3DEffect(
                Angle(degrees: self.rotationAngle),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
            
            
            if isLoading {
                LoadingView()
            }
            
        }
        
        
        
        //        .sheet(isPresented: $showingSheet) {
        //            ForgotPasswordView()
        //                .transition(.move(edge: .trailing))
        
        //        }
    }
}

struct TestLoginView_Previews: PreviewProvider {
    static var previews: some View {
        TestLoginView()
            .environmentObject(ContentModel())
    }
}
