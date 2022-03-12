//
//  OrderModel.swift
//  diplom-project (iOS)
//
//  Created by Aurora on 11.03.2022.
//

import Foundation


class OrderModel: ObservableObject {
    
    
    @Published var orders = [Order]()
    
    
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
        cartRequest.addValue("Bearer \(UserDefaults.standard.string(forKey: "token")!)", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: cartRequest) { (data, resp, err) in
            if let err = err {
                print("failed to add to cart", err)
                return
            }
            guard let data = data else { return}
            do {
                let order = try JSONDecoder().decode([Order].self, from: data)
                DispatchQueue.main.async {
                    self.orders = order
                }
            }
            catch {
                print("fetch json error:")
            }
        }
        .resume()
    }
}
