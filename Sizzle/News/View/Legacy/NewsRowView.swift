//
//  NewsRowView.swift
//  Sizzle
//
//  Created by Averey on 10/11/23.
//

import SwiftUI

struct NewsRowView: View {
    var news: News
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            HStack {
                AsyncImage(url: URL(string: news.imageUrl)) {
                    image in image.image?.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                }
                VStack(alignment: .leading, spacing: 3) {
                    Text(news.articaleName).foregroundColor(.primary)
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .lineLimit(1)
                        .foregroundColor(.purple)
                    Text(news.content)
                        .lineLimit(3)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .frame(height: 100)
        }    }
}

struct NewsRowView_Preview: PreviewProvider {
    static var previews: some View {
        NewsRowView(news: News.newsList().first!)
    }
}
