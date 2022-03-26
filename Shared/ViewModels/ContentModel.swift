//
//  ContentModel.swift
//  diplom-project (iOS)
//
//  Created by Алишер Алсейт on 20.10.2021
//

import Foundation
import SwiftUI

class ContentModel: ObservableObject {
    
    @Published var loggedIn = false
    @Published var currentIndex: Int? = -1
    @AppStorage("isFirstTime")  var isFirstTime = true
    @AppStorage("token") var token = ""
    
    @Published var loginMode = Constants.LoginMode.login
    @Published var errorMessage:String = "Something went wrong"
    @Published var forgotPasswordErrorMessage:String = "nil"
    @Published var resetPasswordErrorMessage:String = "nil"
    @Published var infoTapped = false
    @Published var excltapped = false
    @Published var petroleoums = [Product]()
    @Published var diesels = [Product]()
    @Published var showForgotPasswordView = false
    @Published var forgotPasswordMode = Constants.ForgotPasswordMode.forgotPassword
    @Published var isLoading = false
    @Published var tapped = false
    @Published var user: User?
    @Published var articles = [Article]()
    @Published var carts = [Cart]()
    @Published var cartWithDiscount: Discount?
    @Published var cartTotalItemCount = 0
    @Published var total = 0.0
    @Published var orderTotal = 0.0
    @Published var orders = [Order]()
    
    init() {
        self.fetchProducts()
        self.getArticles()
        self.getCart()
        self.getOrders()
        self.getUser()
    }
    
    func checkExpirityToken() {
        if let date = UserDefaults.standard.object(forKey: "date") as? Date {
            if let diff = Calendar.current.dateComponents([.hour], from: date, to: Date()).hour, diff >= 6 {
                self.token = ""
           }
        }
        
        checkLogin()
    }
    
    func getArticles() {
        isLoading = true
        guard let url = URL(string: "\(Constants.url)/articles") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, res, err in
            if let err = err {
                print("Failed to fetch articles:", err)
                return
            }
            guard let data = data else { return}
            
            do {
                let fetchedArticles = try JSONDecoder().decode([Article].self, from: data)
                
                DispatchQueue.main.async {
                    for article in fetchedArticles {
                        if article.articleId == 1 {
                            self.articles.append(article)
                        }
                    }
                    self.isLoading = false
                }
                
            }
            catch let JsonError {
               print("fetch json error:", JsonError.localizedDescription)
           }
            
        }
        .resume()
    }
    
    // Fetch User
    func getUser() {
        guard let url = URL(string: "\(Constants.url)/user") else {
            return
        }
        var userRequest = URLRequest(url: url)
        userRequest.addValue("Bearer \(UserDefaults.standard.string(forKey: "token") ?? "")", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: userRequest) { data, res, err in
            if let err = err {
                print("Failed to fetch posts:", err)
                return
            }
            guard let data = data else { return}
            
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                
                DispatchQueue.main.async {
                    print("Dwa")
                    self.user = user
                }
                
            }
            catch let JsonError {
               print("fetch json error:", JsonError.localizedDescription)
           }
            
        }
        .resume()
    }
    
    // Product
    func fetchProducts() {
        isLoading = true
        guard let url = URL(string: "\(Constants.url)/products") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, res, err in
            if let err = err {
                print("Failed to fetch posts:", err)
                return
            }
            guard let data = data else { return}
            do {
                let posts = try JSONDecoder().decode([Product].self , from: data)
                DispatchQueue.main.async {
                    for product in posts {
                        if product.category.id == 1 {
                            self.petroleoums.append(product)
                        } else if product.category.id == 2 {
                            self.diesels.append(product)
                        }
                    }
                    self.isLoading = false
                }
            } catch let JsonError {
                self.isLoading = false
                print("fetch json error:", JsonError.localizedDescription)
            }
        }.resume()
    }
    
    // MARK: - Authentication methods
    func checkLogin() {
        DispatchQueue.main.async {
            if self.token == "" {
                self.loggedIn = false
            } else {
                self.loggedIn = true
            }
            
        }
    }

    
    func signOut() {
        token = ""
        
        self.checkLogin()
    }
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
                        self.errorMessage = "User not Found"
                        print(self.errorMessage)
                    }
                    completion("fail")
                    return
                }
                
                if let data = data {
                    do {
                        if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                            if convertedJsonIntoDict["errors"] == nil {
                                DispatchQueue.main.async {
                                    let tokenAcceso = convertedJsonIntoDict["token"] as? String
                                    self.token = tokenAcceso!
                                    UserDefaults.standard.set(Date(), forKey: "date")
                                    completion("success")
                                    print("my token = \(self.token)")
                                    self.getUser()
                                    self.getCart()
                                    self.getOrders()
                                }
                            } else {
                                DispatchQueue.main.async {
                                self.errorMessage = "Wrong Password"
                                completion("fail")
                                }
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
                        self.errorMessage = "Email already used"
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
                                    UserDefaults.standard.set(Date(), forKey: "date")
                                    completion(true)
                                    print("my token = \(self.token)")
                                    self.getUser()
                                    self.getCart()
                                    self.getOrders()
                                }
                            } else {
                                DispatchQueue.main.async {
                                    self.errorMessage = "Failed while registering"
                                    completion(false)
                                }
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
    
    
    //
    func getCartItemCount(cartItem: [Cart]) {
        var itemCount = 0
        for cart in cartItem {
            itemCount += cart.count
        }
        cartTotalItemCount = itemCount
    }
    
    func getCartTotalPrice(carts: [Cart]) {
        var total = 0.0
        for cart in carts {
            total += Double(cart.count) * cart.product.price
        }
        
        DispatchQueue.main.async {
            self.total = total
        }
        
        
        
    }
    
    func getOrderTotalPrice(orders: [Order]) {
        var total = 0.0
        for order in orders {
            total += order.total
        }
        DispatchQueue.main.async {
            self.orderTotal = total
        }
        
    }
    
    func removeItem(cartId: Int, productId: Int, count: Int ) {
        guard let url = URL(string: "\(Constants.url)/carts/\(cartId)") else {
            return
        }
        
        var cartRequest = URLRequest(url: url)
        cartRequest.httpMethod = "PUT"
        cartRequest.addValue("Bearer \(UserDefaults.standard.string(forKey: "token")!)", forHTTPHeaderField: "Authorization")
        do {
            let params = ["product_id": productId, "count": count]
            cartRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: .init())
            cartRequest.setValue("application/json", forHTTPHeaderField: "content-type")
            URLSession.shared.dataTask(with: cartRequest) { (data, resp, err) in
                if let err = err {
                    print("failed to change product count", err)
                    return
                }
                if let resp = resp as? HTTPURLResponse, resp.statusCode == 200 {
                    
                    self.getCart()
                }
            }
            .resume()
        } catch {
            print("error")
        }
    }
    
    func addToCart(productID: Int, count: Int) {
        guard let url = URL(string: "\(Constants.url)/carts")  else {
            return
        }
        var cartRequest = URLRequest(url: url)
        cartRequest.httpMethod = "POST"
        cartRequest.addValue("Bearer \(UserDefaults.standard.string(forKey: "token")!)", forHTTPHeaderField: "Authorization")
        do {
            let params = ["product_id": productID, "count": count]
            cartRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: .init())
            cartRequest.setValue("application/json", forHTTPHeaderField: "content-type")
            URLSession.shared.dataTask(with: cartRequest) { (data, resp, err) in
                if let err = err {
                    print("failed to add to cart", err)
                    return
                }
                if let resp = resp as? HTTPURLResponse, resp.statusCode == 201 {
                    //TODO: - Write some code here
                    
                    self.getCart()
                }
            }
            .resume()
        } catch {
            print("error")
        }
    }
    
    func deleteFromCart(productID: Int) {
        guard let url = URL(string: "\(Constants.url)/carts/\(productID)")  else {
            return
        }
        var cartRequest = URLRequest(url: url)
        cartRequest.httpMethod = "DELETE"
        cartRequest.addValue("Bearer \(UserDefaults.standard.string(forKey: "token")!)", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: cartRequest) { (data, resp, err) in
            if let err = err {
                print("failed to delete product", err)
                return
            }
            if let resp = resp as? HTTPURLResponse, resp.statusCode == 200 {
                self.getCart()
            }
        }
        .resume()
        
    }
    
    func getCart() {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        guard let url = URL(string: "\(Constants.url)/carts")  else {
            return
        }
        var cartRequest = URLRequest(url: url)
        cartRequest.addValue("Bearer \(UserDefaults.standard.string(forKey: "token") ?? "")", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: cartRequest) { (data, resp, err) in
            if let err = err {
                print("failed to add to cart", err)
                return
            }
            guard let data = data else {
                return}
            do {
                let cart = try JSONDecoder().decode(Discount.self, from: data)
                
                DispatchQueue.main.async {
                    
                    self.cartWithDiscount = cart
                    
                    self.carts = cart.carts ?? [Cart]()
                    self.getCartItemCount(cartItem: self.carts)
                    self.getCartTotalPrice(carts: self.carts)
                    self.isLoading = false
                }
            }
            catch {
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                print("fetch cart json error:")
            }
        }
        .resume()
    }
    
    
    
    
    
    
    // Order
    func setOrder() {
        guard let url = URL(string: "\(Constants.url)/orders")  else {
            return
        }
        var cartRequest = URLRequest(url: url)
        cartRequest.httpMethod = "POST"
        cartRequest.addValue("Bearer \(UserDefaults.standard.string(forKey: "token")!)", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: cartRequest) { (data, resp, err) in
            if let err = err {
                print("failed to order", err)
                return
            }
            if let resp = resp as? HTTPURLResponse, resp.statusCode == 200 {
                print("Ordered")
                self.getCart()
                self.getOrders()
                self.getUser()
            }
        }
        .resume()
    }
        
    // Order
    func getOrders() {
        guard let url = URL(string: "\(Constants.url)/orders")  else {
            return
        }
        var cartRequest = URLRequest(url: url)
        cartRequest.addValue("Bearer \(UserDefaults.standard.string(forKey: "token") ?? "")", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: cartRequest) { (data, resp, err) in
            if let err = err {
                print("failed to add to cart", err)
                return
            }
            guard let data = data else { return}
            do {
                let order = try JSONDecoder().decode([Order].self, from: data)
                DispatchQueue.main.async {
                    self.orders = order.sorted(by: {$0.id > $1.id})
                }
                
                self.getOrderTotalPrice(orders: order)
            }
            catch {
                print("fetch json error:")
            }
        }
        .resume()
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
    
    BoardingModel(image: "screen1", title: "How?", description: "Small and large wholesale for the supply of oil products"),
    BoardingModel(image: "screen2", title: "Inspiration", description: "Expand your business with us"),
    BoardingModel(image: "screen3", title: "Share", description: "All types of petroleum products"),
    
]
