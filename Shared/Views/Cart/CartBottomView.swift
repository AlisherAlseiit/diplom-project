//
//  CartBottomView.swift
//  diplom-project (iOS)
//
//  Created by Aurora on 05.03.2022.
//

import SwiftUI

struct CartBottomView: View {
    @State var searchText = ""
    
    // Gesture Properties
    @State var offset: CGFloat = 0
    @State var lastOffset: CGFloat = 0
    @GestureState var gestureOffset: CGFloat = 0
    
    var body: some View {
        
        ZStack {
            
            GeometryReader { proxy in
                
                let frame = proxy.frame(in: .global)
                
                Image("Illustration 1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: frame.width, height: frame.height)
                
            }
            .blur(radius: getBlurRadius())
            .ignoresSafeArea()
            
            // Bottom sheet
            
            
            
            GeometryReader { proxy -> AnyView in
                
                let height = proxy.frame(in: .global).height
                    
                return AnyView(
                    
                    ZStack {
                        
                        CartBlurView(style: .systemThinMaterialDark)
                            .clipShape(CustomCorner(corners: [.topLeft, .topRight], radius: 30))
                        
                        VStack {
                            
                            Capsule()
                                .fill(Color.white)
                                .frame(width: 80, height: 4)
                                .padding(.top)
                            
                            
                            TextField("Search", text: $searchText)
                                .padding(.vertical, 10)
                                .padding(.horizontal)
                                .background(CartBlurView(style: .dark))
                                .cornerRadius(10)
                                .colorScheme(.dark)
                                .padding(.top, 10)
                            
                            //
                            BottomContent()
                        }
                        .padding(.horizontal)
                        .frame(maxHeight: .infinity, alignment: .top)
                    }
                        .offset(y: height - 100)
                        .offset(y: -offset > 0 ? -offset <= (height - 100) ? offset : -(height - 100) : 0)
                        .gesture(DragGesture().updating($gestureOffset, body: { value, out, _ in
                            
                            out = value.translation.height
                            onChange()
                        }).onEnded({ value in
                            
                            let maxHeight = height - 100
                            withAnimation {
                                
                                
                                if -offset > 100 && -offset < maxHeight / 2 {
                                    
                                    offset = -(maxHeight / 3)
                                }
                                else if -offset > maxHeight / 2 {
                                    offset = -maxHeight
                                } else {
                                    offset = 0
                                }
                            }
                            
                            lastOffset = offset
                        }))
                )
            }
            .ignoresSafeArea(.all, edges: .bottom)
            
        }
    }
    
    func onChange() {
        DispatchQueue.main.async {
            self.offset = gestureOffset + lastOffset
        }
    }
    
    func getBlurRadius()->CGFloat {
        
        let progress = -offset / (UIScreen.main.bounds.height - 100)
        
        return progress * 30
    }
    
}

struct CartBottomView_Previews: PreviewProvider {
    static var previews: some View {
        CartBottomView()
    }
}


struct BottomContent: View {
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Text("Favourites")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {}) {
                    Text("See All")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                }
            }
            .padding(.top, 20)
            
            Divider()
                .background(Color.white)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 15) {
                    
                    VStack(spacing: 8) {
                        
                        Button(action: {}) {
                            Image(systemName: "house.fill")
                                .font(.title)
                                .frame(width: 70, height: 70)
                                .background(CartBlurView(style: .dark))
                                .clipShape(Circle())
                        }
                        
                        Text("Home")
                            .foregroundColor(.white)
                    }
                    VStack(spacing: 8) {
                        
                        Button(action: {}) {
                            Image(systemName: "briefcase.fill")
                                .font(.title)
                                .frame(width: 70, height: 70)
                                .background(CartBlurView(style: .dark))
                                .clipShape(Circle())
                        }
                        
                        Text("Work")
                            .foregroundColor(.white)
                    }
                    
                    VStack(spacing: 8) {
                        
                        Button(action: {}) {
                            Image(systemName: "plus")
                                .font(.title)
                                .frame(width: 70, height: 70)
                                .background(CartBlurView(style: .dark))
                                .clipShape(Circle())
                        }
                        
                        Text("Add")
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(.top)
            
            HStack {
                
                Text("Editors pic")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {}) {
                    Text("See All")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                }
            }
            .padding(.top, 25)
            
            Divider()
                .background(Color.white)
        }
    }
}
