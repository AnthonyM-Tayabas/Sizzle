//
//  NewsTabMainView.swift
//  Sizzle
//
//  Created by Tayabas, Anthony Mark (Cognizant) on 10/18/23.
//

import SwiftUI

struct NewsTabView: View {
    
    @StateObject var newsVM = NewsViewModel()
    
    var body: some View {
        NavigationView {
            ArticleListView(articles: articles)
                .overlay(overlayView)
                .task(id: newsVM.fetchTaskToken, loadTask)
                .refreshable(action: refreshTask)
                .navigationTitle(newsVM.fetchTaskToken.category.text)
                .navigationBarItems(trailing: menu)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    @ViewBuilder
    private var overlayView: some View {
        
        switch newsVM.phase {
        case .empty:
            ProgressView()
        case .success(let articles) where articles.isEmpty:
            EmptyPlaceholderView(text: "No Articles", image: nil)
        case .failure(let error):
            RetryView(text: error.localizedDescription, retryAction: refreshTask)
        default: EmptyView()
        }
    }
    
    private var articles: [Article] {
        if case let .success(articles) = newsVM.phase {
            return articles
        } else {
            return []
        }
    }
    
    @Sendable
    private func loadTask() async {
        await newsVM.loadArticles()
    }
    
    @Sendable
    private func refreshTask() {
        DispatchQueue.main.async {
            newsVM.fetchTaskToken = FetchTaskToken(category: newsVM.fetchTaskToken.category, token: Date())
        }
    }
    
    private var menu: some View {
        Menu {
            Picker("Category", selection: $newsVM.fetchTaskToken.category) {
                ForEach(Category.allCases) {
                    Text($0.text).tag($0)
                }
            }
        } label: {
            Image("filter")
                .resizable()
                .frame(width: 16.0, height: 16.0)
        }
    }
}

struct NewsTabView_Previews: PreviewProvider {
    
    @StateObject static var bookmarkVM = BookmarkViewModel.shared
    
    
    static var previews: some View {
        NewsTabView(newsVM: NewsViewModel(articles: Article.previewData))
            .environmentObject(bookmarkVM)
    }
    
}
