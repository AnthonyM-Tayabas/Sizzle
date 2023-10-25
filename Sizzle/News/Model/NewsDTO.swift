//
//  NewsDTO.swift
//  Sizzle
//
//  Created by Tayabas, Anthony Mark (Cognizant) on 10/15/23.
//

import Foundation

struct NewsDTO: Decodable {
    
    let status: String
    let totalResults: Int?
    let articles: [Article]?
    
    let code: String?
    let message: String?
    
}
