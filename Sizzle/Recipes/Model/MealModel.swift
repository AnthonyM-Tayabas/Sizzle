//
//  MealModel.swift
//  Sizzle
//
//  Created by Zalie Christian Amaranto on 10/13/23.
//

import Foundation

struct MealModelResponse: Codable {
    let data: MealModel
}

struct MealModel: Codable, Identifiable {
    let id: String
    let name: String
    let thumbnail: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnail = "strMealThumb"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.thumbnail = try container.decode(String.self, forKey: .thumbnail)
    }
}

struct MealRecordsModel: Codable {
    let meals: [MealModel]
}
