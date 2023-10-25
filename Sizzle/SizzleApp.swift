//
//  SizzleApp.swift
//  Sizzle
//
//  Created by Tayabas, Anthony Mark (Cognizant) on 9/21/23.
//

import SwiftUI

@main
struct SizzleApp: App {
    
    @StateObject var bookmarkVM = BookmarkViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environmentObject(bookmarkVM)
        }
    }
}
