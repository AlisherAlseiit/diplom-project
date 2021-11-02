//
//  SheetView.swift
//  diplom-project (iOS)
//
//  Created by Алишер Алсейт on 31.10.2021.
//

import SwiftUI

struct SheetView: View {
    @EnvironmentObject var model: ContentModel
    var email = ""
    var title = ""
    var subTitle = ""
    var buttonText = ""
    @Binding var isSuccess: Bool
    @Binding var showSheet:Bool
    var body: some View {
        // Your Half Sheet View....
        
            
            
            
        VStack(alignment: .center, spacing: 15){
                
            Text(title)
                    .font(.title2.bold())
                    
                    
            
            Text(subTitle)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 25)
                
            
                Button {
                    showSheet = false
                } label: {
                    Text(buttonText)
                        .foregroundColor(.black)
                        
                }
                .padding(10)

            }
        
        .ignoresSafeArea()
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView(isSuccess: .constant(true), showSheet: .constant(false))
    }
}
