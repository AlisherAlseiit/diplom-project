//
//  SignupViewModel.swift
//  SwufitUI Validation and MVVM
//
//  Created by Stewart Lynch on 2020-05-09.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import Foundation

class SignupViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPw = ""
    @Published var name = ""
    @Published var phoneNum = ""
    
    
    // MARK: - Validation Functions
    
    func passwordsMatch() -> Bool {
        password == confirmPw
    }
    
    func isPhoneNumberValid() -> Bool {
        
        let phoneNumberTest = NSPredicate(format: "SELF MATCHES %@", "^*\\d{10}$")
        
        return phoneNumberTest.evaluate(with: phoneNum)
        
    }
    
    func isPasswordValid() -> Bool {
        // criteria in regex.  See http://regexlib.com
        let passwordTest = NSPredicate(format: "SELF MATCHES %@",
                                       "^([a-zA-Z0-9@*#]{8,15})$")
        return passwordTest.evaluate(with: password)
    }
    
    func isEmailValid() -> Bool {
        // criteria in regex.  See http://regexlib.com
        let emailTest = NSPredicate(format: "SELF MATCHES %@",
                                    "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
        return emailTest.evaluate(with: email)
    }
    
    
    
    var isSignUpComplete: Bool {
        if !passwordsMatch() ||
        !isPasswordValid() ||
        !isEmailValid() {
            return false
        }
        return true
    }
    
    // MARK: - Validation Prompt Strings
    
    var confirmPwPrompt: String {
        if passwordsMatch() {
            return ""
        } else {
            return "Password fields do not match"
        }
    }
    
    var emailPrompt: String {
        if isEmailValid() {
            return ""
        } else {
            return "Enter a valid email address"
        }
    }
    
    var phoneNumPrompt: String {
        if isPhoneNumberValid() {
            return ""
        } else {
            return "Enter exact 10 digts"
        }
    }
    
    var passwordPrompt: String {
        if isPasswordValid() {
            return ""
        } else {
            return "Must consists of at least 8 characters and not more than 15 characters"
        }
    }
    
   
    
    func signUp() {
        // perform signup functions then clear fields
        email = ""
        password = ""
        confirmPw = ""
        phoneNum = ""
        name = ""
        
    }
}
