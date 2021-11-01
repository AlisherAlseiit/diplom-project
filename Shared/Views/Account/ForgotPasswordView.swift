//
//  ForgotPasswordView.swift
//  diplom-project (iOS)
//
//  Created by Алишер Алсейт on 31.10.2021.
//

import SwiftUI

struct ForgotPasswordView: View {
    @EnvironmentObject var model: ContentModel
    @ObservedObject var signupVM = SignupViewModel()
    @State private var fadeToggle: Bool = true
    @State private var email: String = ""
    @State private var verificationCode: String = ""
    @State private var newPassword: String = ""
    @State private var rotationAngle = 0.0
    @State private var passwrodConfirmation = ""
    @State private var showAlert = false
    @State private var infoMessage = false
    @State var showSheet = false
    @State var isSuccess = false
    
    var body: some View {
        
        ZStack {
            
            
            VisualEffectBlur(blurStyle: .light)
                .ignoresSafeArea()
            
            
            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    
                    Text(model.forgotPasswordMode == Constants.ForgotPasswordMode.forgotPassword ? "Reset Password" : "Set New Password")
                        .font(Font.largeTitle.bold())
                        .foregroundColor(.white)
                    
                    if model.forgotPasswordMode == Constants.ForgotPasswordMode.forgotPassword {
                        
                        CustomTextField(field: $signupVM.email, iconName: "envelope.open.fill", isSecure: false, title: "Email", prompt: signupVM.emailPrompt)
                            .submitLabel(.next)
                        
                        
                    }
                    
                    if model.forgotPasswordMode == Constants.ForgotPasswordMode.setNewPassword {
                        
                        CustomTextField(field: $verificationCode, iconName: "number", isSecure: false, title: "Verification Code", prompt: "")
                            .submitLabel(.next)
                        
                        
                        CustomTextField(field: $signupVM.password, iconName: "key.fill", isSecure: true, title: "New Password", prompt: signupVM.passwordPrompt)
                            .textContentType(.password)
                        
                        CustomTextField(field: $signupVM.confirmPw, iconName: "lock.fill", isSecure: true, title: "Confirm Password", prompt: signupVM.confirmPwPrompt)
                            .textContentType(.password)
                    
                    }
                    
                    GradientButton(buttonTitle:model.forgotPasswordMode == Constants.ForgotPasswordMode.forgotPassword ? "Next" : "Confirm") {
                        
                        if  model.forgotPasswordMode == Constants.ForgotPasswordMode.forgotPassword {
                            model.forgotPassword(email: signupVM.email) { err in
                                
                                if !err.contains("error") {
                                    isSuccess = true
                                    showSheet.toggle()
                                    withAnimation(.easeInOut(duration: 0.35)) {
                                        fadeToggle.toggle()
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                                            withAnimation(.easeInOut(duration: 0.35)) {
                                                self.fadeToggle.toggle()
                                            }
                                        }
                                    }
                                    DispatchQueue.main.async {
                                        withAnimation(.easeInOut(duration:0.7)){
                                            
                                            if model.forgotPasswordMode == Constants.ForgotPasswordMode.forgotPassword {
                                                model.forgotPasswordMode = Constants.ForgotPasswordMode.setNewPassword
                                            } else {
                                                model.forgotPasswordMode = Constants.ForgotPasswordMode.forgotPassword
                                            }
                                            self.rotationAngle += 180
                                            
                                        }
                                    }
                                    
                                } else {
                                    isSuccess = false
                                    showSheet.toggle()
                                }
                            }
                        } else {
                            
                            model.resetPassword(code: verificationCode, password: signupVM.password, password_confirmation: signupVM.confirmPw) { err in
                                
                                if !err.contains("error") {
                                    DispatchQueue.main.async {
                                        model.showForgotPasswordView = false
                                        model.forgotPasswordMode = Constants.ForgotPasswordMode.forgotPassword
                                    }
                                   
                                } else {
                                    isSuccess = false
                                    showSheet.toggle()
                                }
                            }
                            
                    }
                    
                    
                    
                    
                    
                    
                    
                }
                .halfSheet(showSheet: $showSheet) {
                    
                    SheetView(email: email, isSuccess: $isSuccess,  showSheet: $showSheet)
                        .environmentObject(model)
                    
                    
                    
                } onEnd: {
                    
                    isSuccess = false
                }
                
                
            }
            .padding(20)
            
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
        
        
        
    }
    
}
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
