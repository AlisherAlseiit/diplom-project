//
//  ProfileView.swift
//  diplom-project (iOS)
//
//  Created by Алишер Алсейт on 21.10.2021.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var model:ContentModel
    var body: some View {
        
        Button {
            model.signOut()
            model.checkLogin()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .frame(width: 100, height: 50)
                Text("Sign Out")
                    .foregroundColor(.white)
            }
        }

        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(ContentModel())
    }
}
