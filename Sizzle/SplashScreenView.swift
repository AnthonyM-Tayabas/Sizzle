//
//  SpashScreenView.swift
//  Sizzle
//
//  Created by Tayabas, Anthony Mark (Cognizant) on 9/21/23.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State var isActive: Bool = false
       
       var body: some View {
           ZStack {
               if self.isActive {
                   MainView()
               } else {
                   Rectangle()
                       .background(Color.white)
                   Image("Sizzle-Transparent")
                       .resizable()
                       .scaledToFit()
                       .frame(width: 300, height: 300)
               }
           }
           .onAppear {
               DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                   withAnimation {
                       self.isActive = true
                   }
               }
           }
           .foregroundColor(Color.white)
       }
    
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
