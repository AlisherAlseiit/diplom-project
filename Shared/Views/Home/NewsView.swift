//
//  AboutUsView.swift
//  diplom-project (iOS)
//
//  Created by Aurora on 26.02.2022.
//

import SwiftUI

struct NewsView: View {
    @State var items = livestreams
    @State var appear = false
    @State var show = true
    @Namespace var namespace
    @State var selectedItem: Livestream? = nil
    @State var offset: CGFloat = .zero
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @State var showAnimation = false
    
    var body: some View {
        ZStack {
            Color("Background 3").edgesIgnoringSafeArea(.all)
            
            ScrollView {
                DateTitle(title: "News")
                layout
            }
            
            
            toogle
            
            fullContent
                .frame(maxWidth: 712)
                .background(Color("Background 1").opacity(appear ? 1 : 0))
                .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                .frame(maxWidth: .infinity)
                .background(
                    
                        BlurView()
                            .opacity(appear ? 1 : 0)
                            .animation(.linear, value: showAnimation)
                            .onTapGesture {
                                showAnimation.toggle()
                            }
                    
                    
                )
                .edgesIgnoringSafeArea(.all)
            
        }
        .navigationTitle("Livestreams")
        .navigationBarHidden(true)
    }
    
    @ViewBuilder
    var layout: some View {
        if horizontalSizeClass == .regular {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: show ? 240 : 700), spacing: 10)], spacing: 10) {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                    content
                }
                
            }
            .padding(20)
        } else {
            VStack (spacing: show ? 30 : -160){
                withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                    content
                }
            }
            .padding(20)
        }
    }
    
    var content: some View {
        ForEach(items.indices) { index in
            GeometryReader { geo in
              
                    VStack(alignment: .center) {
                        NewsItem(livestream: items[index])
                            .matchedGeometryEffect(id: items[index].id, in: namespace, properties: .frame, isSource: !items[index].show)
                            .frame(maxWidth: 600, maxHeight: 300)
                            .onTapGesture {
                                showAnimation.toggle()
                                items[index].show = true
                                items[index].index = 1
                                
                                
                            }
                        
                    }
                    .rotation3DEffect(
                        Angle(degrees: items[index].appear || show ? 0 : Double(5 - geo.frame(in: .global).minY / -20)),
                        axis: (x: -1, y: 0, z: 0.0),
                        anchor: .center,
                        anchorZ: 0.0,
                        perspective: 0.3
                    )
                    .animation(.spring(response: 0.4, dampingFraction: 0.8), value: showAnimation)
                    .onTapGesture {
                        showAnimation.toggle()
                    }
                   
            }
            .zIndex(items[index].index)
            .frame(maxWidth: 600)
            .frame(height: 190)
            
        }
        
        
        
    }
    
    @ViewBuilder
    var fullContent: some View {
        ForEach(items.indices) { index in
            if items[index].show {
               
                ScrollView {
                    NewsItem(livestream: items[index])
                        .matchedGeometryEffect(id: items[index].id, in: namespace, properties: .frame, isSource: items[index].show)
                        .frame(maxWidth: 712)
                        .frame(height: 500)
                        .onTapGesture {
                            showAnimation.toggle()
                            items[index].show = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                items[index].index = 0
                            }
                            
                        }
                        .zIndex(1)
                    CourseSectionContent()
                        .offset(y: appear ? 0 : -100)
                        .opacity(appear ? 1 : 0)
                        .zIndex(0)
                    
                }
                .animation(.spring(response: 0.4, dampingFraction: 0.8), value: showAnimation)
                .onTapGesture(perform: {
                    showAnimation.toggle()
                })
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        appear = true
                    }
                    items[index].appear = true
                }
                .onDisappear {
                    appear = false
                    items[index].appear = false
                }
                
            }
        }
    }
    
    var toogle: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: { show.toggle() }, label: {
                    //                    ToggleButton()
                })
                    .padding()
            }
            Spacer()
        }
    }
}




struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
