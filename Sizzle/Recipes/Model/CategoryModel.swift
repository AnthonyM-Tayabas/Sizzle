//
//  CategoryModel.swift
//  Sizzle
//
//  Created by Renzy Ortega on 10/4/23.
//

import Foundation

struct CategoryModelResponse: Codable {
    let data: CategoryModel
}

struct CategoryModel: Codable, Identifiable {
    let id: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case name = "strCategory"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }
}

struct CategoryRecordsModel: Codable {
    let categories: [CategoryModel]
}
