//
//  NewsAPI.swift
//  Sizzle
//
//  Created by Tayabas, Anthony Mark (Cognizant) on 10/21/23.
//

import Foundation

class NewsAPI: NSObject {
    
    static let shared = NewsAPI()
    private let api = API()
    private let baseURL = "https://newsapi.org/v2"
    private let apiKey = "2c3a6f6b6ce3400eb0aea0d806e6d6a7"
    private let defaultCountry = "ph"
    
    private func sendRequest(urlRequest: URLRequest) async throws -> (Data, URLResponse) {
        if let data = urlRequest.httpBody,
           let encodedReqResUserString = String(data: data, encoding: .utf8) {
            print("\(urlRequest) and httpBody \(encodedReqResUserString)")
        }
        let (data, response) = try await api.data(for: urlRequest)
        return (data, response)
    }
    
    func getHeadlines() async throws -> (Data, URLResponse) {
        guard let url = URL(string: "\(baseURL)/top-headlines?country=\(defaultCountry)?apiKey=\(apiKey)") else {
            throw NSError(domain: "Something", code: 400) }
        var urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
        urlRequest.httpMethod = "GET"
        urlRequest.httpBody = nil
        
        let (data, response) = try await sendRequest(urlRequest: urlRequest)
        return (data, response)
    }
    
}
