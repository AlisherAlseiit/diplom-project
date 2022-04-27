//
//  StatisticsView.swift
//  diplom-project (iOS)
//
//  Created by Alish Alseiit on 15.04.2022.
//

import SwiftUI

struct StatisticsView: View {
    @EnvironmentObject var model: ContentModel
    @State var brent: Brent?
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Current Price")) {
                Text("Brent:")
                    .badge("$\(brent?.Brent ?? 0.0)")
                }
            }
            .task {
                await fetchBentPrice()
            }
            .refreshable {
                await fetchBentPrice()
            }
            .navigationTitle("Statistics")
        }
        
    }
    
    
    func fetchBentPrice() async {
        guard let url = URL(string: "\(Constants.url)/oil-price") else {
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            self.brent = try JSONDecoder().decode(Brent.self, from: data)
        } catch let JsonError {
            print("fetch json error:", JsonError.localizedDescription)
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView(brent: Brent(Brent: 0.0))
            .environmentObject(ContentModel())
    }
}
