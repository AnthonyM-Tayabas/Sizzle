//
//  News.swift
//  Sizzle
//
//  Created by Tayabas, Anthony Mark (Cognizant) on 10/21/23.
//

import Foundation

struct NewsDTO {
    let status: String
    let totalResults: Int?
    let articles: [Article]?
    let code: String?
    let message: String?
}

struct Source {
    let name: String
}
