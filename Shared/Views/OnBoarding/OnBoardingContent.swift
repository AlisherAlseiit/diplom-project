//
//  OnBoardingContent.swift
//  diplom-project (iOS)
//
//  Created by Алишер Алсейт on 21.10.2021.
//

import SwiftUI

struct OnBoardingContent: View {
    var body: some View {
        HStack(spacing: 0) {
            ForEach(boardingScreens) { screen in
                VStack(spacing: 15) {
                    Image(screen.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: getScreenBounds().width - 100, height: getScreenBounds().width - 100)
                    // small screen adoption...
                        .scaleEffect(getScreenBounds().height < 750 ? 0.9 : 1)
                        .offset(y: getScreenBounds().height < 750 ? -100 : -120)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text(screen.title)
                            .font(.largeTitle.bold())
                            .foregroundColor(.white)
                            .padding(.top, 20)
                        
                        Text(screen.description)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .offset(y: -70)
                }
                .padding()
                .frame(width: getScreenBounds().width)
                .frame(maxHeight: .infinity)
                
            }
            
        }
    }
}

struct OnBoardingContent_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingContent()
    }
}
