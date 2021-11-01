//
//  ContentModel.swift
//  diplom-project (iOS)
//
//  Created by Алишер Алсейт on 20.10.2021.
//

import Foundation
import SwiftUI




class ContentModel: ObservableObject {
    
    @Published var loggedIn = false
    @Published var currentIndex: Int? = -1
    @AppStorage("isFirstTime")  var isFirstTime = true
    @AppStorage("token") var token = ""
    
    @Published var loginMode = Constants.LoginMode.login
    @Published var errorMessage:String = "Something went wrong."
    @Published var forgotPasswordErrorMessage:String = "nil"
    @Published var resetPasswordErrorMessage:String = "nil"
    @Published var infoTapped = false
    @Published var excltapped = false
    @Published var products = [Product]()
    @Published var showForgotPasswordView = false
    @Published var forgotPasswordMode = Constants.ForgotPasswordMode.forgotPassword
    
    @Published var tapped = false
    
    
//    func fetchPosts() {
//        guard let url = URL(string: "https://api.edev.kz/api/products") else {
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, res, err in
//
//            if let err = err {
//                print("Failed to fetch posts:", err)
//                return
//            }
//
//            guard let data = data else { return}
//
//            do {
//                let posts = try JSONDecoder().decode([Product].self , from: data)
//
//                DispatchQueue.main.async {
//                    self.products = posts
//                }
//
//            } catch let JsonError {
//                print("fetch json error:", JsonError.localizedDescription)
//            }
//
//
//        }.resume()
//
//    }
    
    // MARK: - Authentication methods
    
    func checkLogin() {
        DispatchQueue.main.async {
            self.loggedIn = self.token == "" ? false : true
        }
      
        
        
    }
    
    func signOut() {
        
        token = ""
        
    }
    
    
//    forgot-password-mobile
//    /reset-password-mobile
    
    func resetPassword(code: String, password: String, password_confirmation: String, completion: @escaping (String) -> Void) {
       
        guard let url = URL(string: "\(Constants.url)/reset-password-mobile")
        else {
            print("error chet ne znayu")
            return
            
        }
        
        var resetPasswordRequest = URLRequest(url: url)
        resetPasswordRequest.httpMethod = "POST"
        
        do {
            
            let params = ["code": code, "password": password, "password_confirmation":password_confirmation]
            resetPasswordRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: .init())
            
            resetPasswordRequest.setValue("application/json", forHTTPHeaderField: "content-type")
            
            URLSession.shared.dataTask(with: resetPasswordRequest) { (data, resp, err) in
            
                if let err = err {
                    print("failed to resetPassword:", err)
                    return
                }
                
                if let resp = resp as? HTTPURLResponse, resp.statusCode != 200 {
                    
                    print("cant reset Password")
 
                    DispatchQueue.main.async {
                        let errorString = String(data: data ?? Data(), encoding: .utf8) ?? ""
                        self.resetPasswordErrorMessage = NSError(domain: "", code: resp.statusCode, userInfo: [NSLocalizedDescriptionKey: errorString]).localizedDescription
//                        print(self.resetPasswordErrorMessage)
                        completion("error")
                    }
                    
                    return
                }
                completion("fine")
                
            }.resume()
        }
        
        catch {
            
        }
        
    }
    
    func forgotPassword(email: String, completion: @escaping (String) -> Void) {
        
        guard let url = URL(string: "\(Constants.url)/forgot-password-mobile")
        else {
            print("error chet ne znayu")
            return
            
        }
        
        var forgotPasswordRequest = URLRequest(url: url)
        forgotPasswordRequest.httpMethod = "POST"
        
        do {
            
            let params = ["email": email]
            forgotPasswordRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: .init())
            
            forgotPasswordRequest.setValue("application/json", forHTTPHeaderField: "content-type")
            
            URLSession.shared.dataTask(with: forgotPasswordRequest) { (data, resp, err) in
               
                if let err = err {
                    print("failed to resetPassword:", err)
                    return
                }
                
                if let resp = resp as? HTTPURLResponse, resp.statusCode != 200 {
                    
                    print("cant reset Password")
 
                    DispatchQueue.main.async {
                        let errorString = String(data: data ?? Data(), encoding: .utf8) ?? ""
                        self.forgotPasswordErrorMessage = NSError(domain: "", code: resp.statusCode, userInfo: [NSLocalizedDescriptionKey: errorString]).localizedDescription
//                        print(self.forgotPasswordErrorMessage)
                        completion("error")
                    }
                    
                    return
                }
                completion("fine")
                
                
                
                
            }.resume()
        }
        
        catch {
            print("error chet ne znayu")
        }
        
    }
    
    
    func login(email: String, password: String, completion: @escaping (String) -> Void) {
        print("Performin Login")
        
        guard let url = URL(string: "\(Constants.url)/login")
        else { return }
        
        var loginRequest = URLRequest(url: url)
        loginRequest.httpMethod = "POST"
        
        do {
            // fromSwiftApp@mail.ru pass: 123123
            let params = ["email": email, "password": password]
            loginRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: .init())
            
            loginRequest.setValue("application/json", forHTTPHeaderField: "content-type")
            
            URLSession.shared.dataTask(with: loginRequest) { (data, resp, err) in
                
                if let err = err {
                    print("failed to login:", err)
                    return
                }
                
                
                if let resp = resp as? HTTPURLResponse, resp.statusCode != 200 {
                    
                    print("cant login")
 
                    DispatchQueue.main.async {
                        let errorString = String(data: data ?? Data(), encoding: .utf8) ?? ""
                        self.errorMessage = NSError(domain: "", code: resp.statusCode, userInfo: [NSLocalizedDescriptionKey: errorString]).localizedDescription
                        print(self.errorMessage)
                        
                    }
                    completion("fail")
                    return
                }
                
                
                if let data = data {
                    do {
                        if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                            
                            let responseError = convertedJsonIntoDict["error"] as? String
                            
                            
                            
                            if responseError?.count == nil {
                                
                                DispatchQueue.main.async {
                                    let tokenAcceso = convertedJsonIntoDict["token"] as? String
                                    self.token = tokenAcceso!
                                    completion("success")
                                    print("my token = \(self.token)")
                                    
                                }
                            } else {
                                print("error")
                            }
                        }
                    }
                    catch let error as NSError {
                        print("catch let error")
                        print(error.localizedDescription)
                    }
                }
                
                
                
            }.resume()
            
        }
        catch {
            print("Failed to serilaize data:", error)
        }
        
    }
    func register(email: String, password: String, name: String, phone: String, confirmPassword: String, completion: @escaping (Bool) -> Void) {
        print("Performin Registration")
        
        guard let url = URL(string: "\(Constants.url)/register")
        else { return }
        
        var loginRequest = URLRequest(url: url)
        loginRequest.httpMethod = "POST"
        
        do {
            
            let params = ["email": email, "password": password, "name": name, "phone": phone, "password_confirmation": confirmPassword]
            loginRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: .init())
            
            loginRequest.setValue("application/json", forHTTPHeaderField: "content-type")
            
            URLSession.shared.dataTask(with: loginRequest) { (data, resp, err) in
                
                if let err = err {
                    print("failed to register:", err)
                    return
                }
                
                if let resp = resp as? HTTPURLResponse, resp.statusCode != 200 {
                    
                    
                    DispatchQueue.main.async {
                        
                        self.errorMessage = "Coudln't register"
                        completion(false)
                    }
                    return
                }
                
                
                if let data = data {
                    do {
                        if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                            
                            let responseError = convertedJsonIntoDict["error"] as? String
                            
                            
                            
                            if responseError?.count == nil {
                                
                                DispatchQueue.main.async {
                                    let tokenAcceso = convertedJsonIntoDict["token"] as? String
                                    self.token = tokenAcceso!
                                    completion(true)
                                    print("my token = \(self.token)")
                                    
                                }
                            } else {
                                print("error")
                            }
                        }
                    }
                    catch let error as NSError {
                        print("catch let error")
                        print(error.localizedDescription)
                    }
                }
                
                
                
                
                
                
            }.resume()
            
        }
        catch {
            print("Failed to serilaize data:", error)
        }
        
    }
}

struct BoardingModel: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var description: String
}

// Same Title and desc...
let title = "Easy Payments with \nWalletory"
let description = "Small business can receive device \npayment super fast and super easy"


// Since image name and BG color name are same....

// Sample Model SCreens....
var boardingScreens = [

    BoardingModel(image: "screen1", title: "How?", description: "With carefully crafted filters, we'll make almost all your social media more eye catching"),
    BoardingModel(image: "screen2", title: "Inspiration", description: "To find the right words and designs we've got a How To section for you"),
    BoardingModel(image: "screen3", title: "Share", description: "Also, to give you ideas, you can see what others have written and designed"),
    BoardingModel(image: "screen4", title: "Small Business", description: "you're here to design your brand from the ground up"),
]
