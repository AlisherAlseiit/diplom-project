//
//  CartModel.swift
//  diplom-project (iOS)
//
//  Created by Aurora on 11.03.2022.
//

import SwiftUI
import Foundation

class CartModel: ObservableObject {
    
    @Published var cart = [Cart]()
    @Published var isLoading = false
    @Published var cartTotalItemCount = 0
    
    
    func getCartItemCount(cartItem: [Cart]) {
        var itemCount = 0
        for cart in cartItem {
            itemCount += cart.count
        }
        cartTotalItemCount = itemCount
        
         
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
        cartRequest.addValue("Bearer \(UserDefaults.standard.string(forKey: "token")!)", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: cartRequest) { (data, resp, err) in
            if let err = err {
                print("failed to add to cart", err)
                return
            }
            guard let data = data else {
                return}
            do {
                let cart = try JSONDecoder().decode([Cart].self, from: data)
                
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.cart = cart
                    self.getCartItemCount(cartItem: cart)
                }
            }
            catch {
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                print("fetch json error:")
            }
        }
        .resume()
    }
    
}
