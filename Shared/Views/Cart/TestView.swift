//
//  TestView.swift
//  diplom-project (iOS)
//
//  Created by Aurora on 09.03.2022.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        TabView {
            
            Rectangle().foregroundColor(.red)
            Rectangle().foregroundColor(.white)
            Rectangle().foregroundColor(.black)
        }
        .tabViewStyle(PageTabViewStyle())
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
