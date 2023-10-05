//
//  API.swift
//  Sizzle
//
//  Created by Renzy Ortega on 10/4/23.
//

import Foundation

class API: NSObject {
    private let session: URLSession = URLSession.shared
    
    func data(for urlRequest: URLRequest) async throws -> (Data, URLResponse) {
        let (data, response) = try await session.data(for: urlRequest)
        
        guard
            let httpUrlResponse = response as? HTTPURLResponse,
            httpUrlResponse.statusCode >= 200 && httpUrlResponse.statusCode < 300
        else { throw NSError(domain: "API Error", code: 100) }
        
        return (data, response)
    }
}
