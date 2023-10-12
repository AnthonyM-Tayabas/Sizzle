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
        NavigationView {
            VStack (alignment: .leading) {
                NavigationLink(destination: NewsDetailedView(news: news.first!)) {
                    VStack {
                        AsyncImage(url: URL(string: news.first!.imageUrl)) {
                            image in image.image?.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 200)
                                .cornerRadius(10)
                                .padding(10)
                        }

                        VStack (alignment: .leading, spacing: 10) {
                            Text(news[0].articaleName)
                                .font(.title2)
                                .fontWeight(.bold)
                                .lineLimit(3)
                            Text(news[0].datePublished).foregroundColor(.gray)

                        }
                        .padding(10)
                    }
                }
                Divider()
                NewsMainListView()
            }
            .frame(maxHeight: .infinity , alignment: .topTrailing)
            .navigationTitle(Text("Today's Top News")
            .font(.headerRegularSizzle))
            .navigationBarTitleDisplayMode(.inline)
            .padding(5)
        }
        
    }
}

struct NewsMainView_Previews: PreviewProvider {
    static var previews: some View {
        NewsMainView()
    }
}
