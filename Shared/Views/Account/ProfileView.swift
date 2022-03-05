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
        NavigationView {
            ZStack {
                Color("Background 6").edgesIgnoringSafeArea(.all)
                
                
                List {
                    Section {
                        ProfileInfoItem()
                    }
                    Section {
                        ForEach(firstListSections) { section in
                            NavigationLink(destination: Text("Dwa")) {
                                SectionRow(section: section)
                                
                            }
                            .padding(5)
                        }
                    }
                    
                    Section {
                        ForEach(secondListSections) { section in
                            Link(destination: URL(string: "https://m.yelp.com/biz/tacorea-san-francisco?utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=OYbm7rBdHJaRh5-qGZk-5g")!) {
                                
                                linkSectionRow(section: section)
                                    .padding(5)
                            }
                            .accentColor(Color.black)
                        }
                    }
                    Section {
                        HStack {
                            Spacer()
                            Button(action: {
                                model.signOut()
                                model.checkLogin()
                            }) {
                                Text("Sign Out")
                                    .foregroundColor(.red)
                            }
                            Spacer()
                        }
                    }
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle("Account")
        }
        .onAppear {
            UITableView.appearance().sectionFooterHeight = 15
            UITableView.appearance().sectionHeaderHeight = 15
        }
    }
    
    
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(ContentModel())
    }
}


/*
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
 */
