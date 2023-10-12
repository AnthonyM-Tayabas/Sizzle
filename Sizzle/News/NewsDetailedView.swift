//
//  NewsDetailedView.swift
//  Sizzle
//
//  Created by Averey on 10/11/23.
//

import SwiftUI

struct NewsDetailedView: View {
    var news: News
    
    var body: some View {
        VStack (alignment: .center, spacing: 3) {
            Text(news.articaleName).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).multilineTextAlignment(.center)
                .padding(10)
            
            HStack {
                Text("Publisher: \(news.publisher)")
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(news.datePublished)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(10)
            
            AsyncImage(url: URL(string: news.imageUrl)) {
                image in image.image?.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 350 ,height: 300)
                    .cornerRadius(10)
                    .padding(10)
            }

            
            Text(news.content)
                .font(.title3)
                .padding(10)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            Spacer()
        }
        .padding(15)
    }
}

struct NewsDetailedView_Preview: PreviewProvider {
    static var previews: some View {
        NewsDetailedView(news: News.newsList()[0])
    }
}
