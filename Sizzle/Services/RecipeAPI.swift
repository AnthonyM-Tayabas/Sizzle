//
//  RecipeAPI.swift
//  Sizzle
//
//  Created by Renzy Ortega on 10/4/23.
//

import Foundation

class RecipeAPI: NSObject {
    
    static let shared = RecipeAPI()
    private let api = API()
    private let baseURL = "https://www.themealdb.com/api/json/v1/1"
    
    private func sendRequest(urlRequest: URLRequest) async throws -> (Data, URLResponse) {
        if let data = urlRequest.httpBody,
           let encodedReqResUserString = String(data: data, encoding: .utf8) {
            print("\(urlRequest) and httpBody \(encodedReqResUserString)")
        }
        let (data, response) = try await api.data(for: urlRequest)
        return (data, response)
    }
    
    func getCategories() async throws -> (Data, URLResponse) {
        guard let url = URL(string: "\(baseURL)/categories.php") else { throw NSError(domain: "something", code: 100) }
        var urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
        urlRequest.httpMethod = "GET"
        urlRequest.httpBody = nil
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await sendRequest(urlRequest: urlRequest)
        
        return (data, response)
    }
}
