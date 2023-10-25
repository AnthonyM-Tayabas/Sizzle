//
//  NewsMainListView.swift
//  Sizzle
//
//  Created by Averey on 10/11/23.
//

import SwiftUI

struct NewsMainListView: View {
    var body: some View {
            VStack {
                NavigationLink(destination: NewsSeeListView()) {
                    Text("See All")
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(5)

                List (News.newsList().prefix(upTo: 3)) { n in
                    NavigationLink {
                        NewsDetailedView(news: n)
                    } label: {
                        NewsRowView(news: n)
                    }
                }
                .listStyle(.plain)
            }
    }
}

struct NewsMainListView_Preview: PreviewProvider {
    static var previews: some View {
        NewsMainListView()
    }
}
