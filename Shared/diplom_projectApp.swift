//
//  diplom_projectApp.swift
//  Shared
//
//  Created by Алишер Алсейт on 20.10.2021.
//

import SwiftUI

@main
struct diplom_projectApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
        }
    }
}
