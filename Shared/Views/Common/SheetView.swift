//
//  SheetView.swift
//  diplom-project (iOS)
//
//  Created by Алишер Алсейт on 31.10.2021.
//

import SwiftUI

struct SheetView: View {
    @EnvironmentObject var model: ContentModel
    @State var email = ""
    @Binding var isSuccess: Bool
    @Binding var showSheet:Bool
    var body: some View {
        // Your Half Sheet View....
        
            
            
            
        VStack(alignment: .center, spacing: 15){
                
            Text(isSuccess ? "Check Email" : "oops, something went wrong...")
                    .font(.title2.bold())
                    
                    
            
            Text(isSuccess ? "We sent the confirmation code to \(email). Use it to reset your password." : "You entered a wrong email, please try again.")
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 25)
                
            
                Button {
                    showSheet = false
                } label: {
                    Text(isSuccess ? "Set New Password" : "Ok")
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
