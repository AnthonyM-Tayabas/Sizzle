//
//  NewsSeeListView.swift
//  Sizzle
//
//  Created by Averey on 10/11/23.
//

import SwiftUI

struct NewsSeeListView: View {
    var body: some View {
        NavigationView {
            List (News.newsList()) { n in
                NavigationLink {
                    NewsDetailedView(news: n)
                } label: {
                    NewsRowView(news: n)
                }
            }
            .listStyle(.plain)
            .navigationBarHidden(true)
        }
    }
}

struct NewsSeeListView_Preview: PreviewProvider {
    static var previews: some View {
        NewsSeeListView()
    }
}
