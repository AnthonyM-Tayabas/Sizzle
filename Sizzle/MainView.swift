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
                
                NavigationLink {
                    NewsMainView()
                } label: {
                    Text("News")
                        .font(.headerRegularSizzle)
                        .foregroundColor(.accentColor)
                }
                
                NavigationLink {
                    RecipesMainView()
                } label: {
                    Text("Recipes")
                        .font(.headerRegularSizzle)
                        .foregroundColor(.accentColor)
                }
                
            }
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity,
                   alignment: .top)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
