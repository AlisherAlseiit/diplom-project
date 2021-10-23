//
//  OnBoardingView.swift
//  diplom-project (iOS)
//
//  Created by Алишер Алсейт on 20.10.2021.
//

import SwiftUI

struct OnBoardingView: View {
    @EnvironmentObject var model:ContentModel
    @State var offset: CGFloat = 0
    var body: some View {
        ZStack(alignment: .top){
            OffsetPageTabView(offset: $offset) {
                
                OnBoardingContent()
            }
            .background(

                RoundedRectangle(cornerRadius: 50)
                    .fill(.white)

                    .frame(width: getScreenBounds().width - 100, height: getScreenBounds().width - 100)
                    .scaleEffect(2)
                    .rotationEffect(.init(degrees: 25))
                    .rotationEffect(.init(degrees: getRotation()))
                    .offset(y: -getScreenBounds().width + 20)


                ,alignment: .leading

            )
            .background(Color("screen\(getIndex() + 1)")
                            .animation(.easeInOut, value: getIndex())
            )
            .ignoresSafeArea(.container, edges: .all)
            .overlay(
                
                OnBoardingOverlay(getIndex: getIndex(), offset: $offset)
                    .padding()
                ,alignment: .bottom
            )
        
            
            HStack(alignment: .center) {
                BackButtonView(getIndex: getIndex(), offset: $offset)
                Spacer()
                if model.excltapped {
                Text("Exit")
                    .foregroundColor(.purple)
                    .onTapGesture {
                        model.excltapped = false
                        
                    }
                } 
            }
            .padding(.top, model.excltapped ? 30 : 0)
            .padding(15)
            
        }

    }
    
    func getRotation()->Double {
        
        let progress = offset / (getScreenBounds().width * 4)
        
        // Doing one full rotation
        let rotation = Double(progress) * 360
        
        return rotation
    }
    
    func getIndex()->Int {
        let progress = (offset / getScreenBounds().width).rounded()
//        print("Screen bounds: \(getScreenBounds().width.rounded())")
//        print("offset: \(offset)")
//        print(progress)
        
        return Int(progress)
    }
    
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
            .environmentObject(ContentModel())
    }
}

extension View {
    func getScreenBounds()->CGRect{
        
        return UIScreen.main.bounds
    }
}


