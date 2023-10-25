//
//  BookmarkTabView.swift
//  Sizzle
//
//  Created by Tayabas, Anthony Mark (Cognizant) on 10/18/23.
//

import SwiftUI

struct BookmarkTabView: View {
    
    @EnvironmentObject var bookmarkVM: BookmarkViewModel
    @State var searchText: String = ""
    
    var body: some View {
        let articles = self.articles
        
        NavigationView {
            ArticleListView(articles: articles)
                .overlay(overlayView(isEmpty: articles.isEmpty))
                .navigationTitle("Saved Articles")
        }
        .searchable(text: $searchText)
        .font(.headlineRegularSizzle)
        .foregroundColor(.black)
    }
    
    private var articles: [Article] {
        if searchText.isEmpty {
            return bookmarkVM.bookmarks
        }
        return bookmarkVM.bookmarks
            .filter {
                $0.title.lowercased().contains(searchText.lowercased()) ||
                $0.descriptionText.lowercased().contains(searchText.lowercased())
            }
    }
    
    @ViewBuilder
    func overlayView(isEmpty: Bool) -> some View {
        if isEmpty {
            EmptyPlaceholderView(text: "No saved articles", image: Image(systemName: "bookmark"))
        }
    }
}

struct BookmarkTabView_Previews: PreviewProvider {
    
    @StateObject static var bookmarkVM = BookmarkViewModel.shared
    
    static var previews: some View {
        BookmarkTabView()
            .environmentObject(bookmarkVM)
    }
}
