//
//  OnBoardingOverlay.swift
//  diplom-project (iOS)
//
//  Created by Алишер Алсейт on 21.10.2021.
//

import SwiftUI

struct OnBoardingOverlay: View {
    var getIndex: Int = 0
    
    @Binding var offset: CGFloat
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        VStack {
            
            if !model.excltapped {
                HStack(spacing: 25) {
                    
                    Button {
                        model.isFirstTime = false
                        model.loginMode = Constants.LoginMode.login
                    } label: {
                        Text("Login")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .background(Color.white, in: RoundedRectangle(cornerRadius: 12))
                        
                    }
                    
                    
                    
                    
                    Button {
                        model.isFirstTime = false
                        model.loginMode = Constants.LoginMode.creteAccount
                    } label: {
                        Text("SignUp")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .offset(x: -5)
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .background(Color.white, in: RoundedRectangle(cornerRadius: 12))
                        
                    }
                }
                .padding(.bottom, 30)
        }
            
            HStack {
                
                Button {
                    offset = getScreenBounds().width * 3
                } label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                
                HStack(spacing: 8) {
                    ForEach(boardingScreens.indices, id: \.self) { index in
                        Circle()
                            .fill(.white)
                            .opacity(index == getIndex ? 1 : 0.4)
                            .frame(width: 8, height: 8)
                            .scaleEffect(index == (getIndex) ? 1.3 : 0.85)
                            .animation(.easeInOut, value: getIndex)
                        
                    }
                }
                .frame(maxWidth: .infinity)
                
                Button {
                    
                    // max 4 screens so max will be 3*width
                    offset = min(offset + getScreenBounds().width, getScreenBounds().width * 3)
                    
                } label: {
                    Text("Next")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
            }
            .padding(.bottom, model.excltapped ? 30 : 0)
            .padding(.horizontal, 8)
            
        }
    }
}

struct OnBoardingOverlay_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingOverlay(offset: .constant(0))
            .environmentObject(ContentModel())
    }
}
