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
    @ObservedObject var signupVM = SignupViewModel()
    @State private var showingSheet = false
    @FocusState private var focusedField: Field?
    @State var isLoading = false
    
    @ViewBuilder
    var body: some View {
        
        ZStack {
            
            general
            
            if getScreenBounds().height <= 667{
                GeometryReader { geometry in
                    ScrollView (showsIndicators: false) {
                        trys
                 
                    .frame(height: geometry.size.height)
                    .padding(.vertical, model.loginMode == Constants.LoginMode.creteAccount ? 50 : 0)
                    
                    }
                
                }
            } else {
                trys
            }
            
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
                .padding(.top, getScreenBounds().height <= 667 ? 50 : 0)
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
    
    @ViewBuilder
    var trys: some View {
        ZStack {
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
                
                CustomTextField(field: $signupVM.email, iconName: "envelope.open.fill", isSecure: false, title: "Email", prompt: signupVM.emailPrompt)
                    .focused($focusedField, equals: .email)
                    .submitLabel(.next)
                
                
                if model.loginMode == Constants.LoginMode.creteAccount {
                    
                    CustomTextField(field: $signupVM.name, iconName: "person.fill", isSecure: false, title: "Name", prompt: signupVM.namePromt)
                        .focused($focusedField, equals: .name)
                        .submitLabel(.next)
                    
                    
                    
                    CustomTextField(field: $signupVM.phoneNum, iconName: "8.circle.fill",isSecure: false, title: "phone number", prompt: signupVM.phoneNumPrompt)
                        .focused($focusedField, equals: .phoneNumber)
                        .submitLabel(.next)
                        .keyboardType(.decimalPad)
                    
                    
                }
                
                
                CustomTextField(field: $signupVM.password, iconName: "key.fill", isSecure: true, title: "Password", prompt: signupVM.passwordPrompt)
                    .focused($focusedField, equals: .password)
                    .submitLabel(model.loginMode == Constants.LoginMode.login ? .join : .next)
                    .textContentType(.password)
                
                
                
                
                
                if model.loginMode == Constants.LoginMode.creteAccount {
                    
                    CustomTextField(field: $signupVM.confirmPw, iconName: "lock.fill", isSecure: true, title: "Confirm Password", prompt: signupVM.confirmPwPrompt)
                        .focused($focusedField, equals: .confirmPassword)
                        .submitLabel(.join)
                        .textContentType(.password)
                    
                }
                
                
                GradientButton(buttonTitle: model.loginMode == Constants.LoginMode.creteAccount ? "Create Account" : "Sign in") {
                    
                    if model.loginMode == Constants.LoginMode.login {
                        self.isLoading = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                            model.login(email: signupVM.email, password: signupVM.password) { message in
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
                            model.register(email: signupVM.email, password: signupVM.password, name: signupVM.name, phone: signupVM.phoneNum, confirmPassword: signupVM.confirmPw) { _ in
                                isLoading = false
                                model.checkLogin()
                            }
                        }
                        
                    }
                    
                }
                .disabled(model.loginMode == Constants.LoginMode.creteAccount ? !signupVM.isSignUpComplete : !signupVM.isSignInComplete)
                
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
                case .password:
                    focusedField = .confirmPassword
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
            
            
        }
        
        
    }
}

struct TestLoginView_Previews: PreviewProvider {
    static var previews: some View {
        TestLoginView()
            .environmentObject(ContentModel())
    }
}
