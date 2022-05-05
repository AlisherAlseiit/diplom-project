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
                List {
                    Section {
                        ProfileInfoItem()
                    }
                    if model.user != nil {
                        Section {
                            BonusInfoView(card: model.user!.card)
                        }
                    }
                    Section {
                        NavigationLink(destination: OrderHistoryView()) {
                            SectionRow(section: firstListSections[3])
                            
                        }
                        .padding(5)
                        
                        ForEach(secondListSections) { section in
                            Link(destination: URL(string: section.link)!) {
                                
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
                                
                            }) {
                                Text("Sign Out")
                                    .foregroundColor(.red)
                            }
                            Spacer()
                        }
                    }
                }
                .listStyle(.insetGrouped)
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
