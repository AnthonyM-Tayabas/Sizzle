//
//  NewsMainView.swift
//  Sizzle
//
//  Created by Tayabas, Anthony Mark (Cognizant) on 9/21/23.
//

import SwiftUI

struct NewsMainView: View {
    var news = News.newsList()
    
    var body: some View {
        NavigationStack {
            TabView {
                NewsTabView()
                    .tabItem {
                        Label("News", systemImage: "newspaper")
                    }
                
                SearchTabView()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                
                BookmarkTabView()
                    .tabItem {
                        Label("Saved", systemImage: "bookmark")
                    }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct NewsMainView_Previews: PreviewProvider {
    static var previews: some View {
        NewsMainView()
    }
}
