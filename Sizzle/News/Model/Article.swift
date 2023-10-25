//
//  Article.swift
//  Sizzle
//
//  Created by Tayabas, Anthony Mark (Cognizant) on 10/21/23.
//

import Foundation

struct Article {
    let source: Source
    let title: String
    let url: String
    let publishedAt: Date
    
    let author: String?
    let description: String?
    let urlToImage: String?
}
