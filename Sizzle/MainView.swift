//
//  ContentView.swift
//  Sizzle
//
//  Created by Tayabas, Anthony Mark (Cognizant) on 9/21/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            VStack (alignment: .center) {
                Image("Sizzle-White-Bg")
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding(.top, -128)
                
                NavigationLink {
                    NewsMainView()
                        .navigationTitle("Sizzling News")
                } label: {
                    Text("News")
                        .font(.headerRegularSizzle)
                        .foregroundColor(.accentColor)
                }
                .padding(.top, 256)
                
                NavigationLink {
                    RecipesMainView()
                        .navigationTitle("Sizzling Recipes")
                } label: {
                    Text("Recipes")
                        .font(.headerRegularSizzle)
                        .foregroundColor(.accentColor)
                }
                .padding(.top, 12)
            }
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity,
                   alignment: .center)
            
            Text("We're building more tools just for you.")
                .font(.descriptionRegularSizzle)
                .foregroundColor(.gray)
                .padding(.bottom, 24)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
