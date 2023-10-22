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
    let category: String
    let ingredients: [String]
    let instructions: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnail = "strMealThumb"
        case category = "strCategory"
        case strIngredient1
        case strIngredient2
        case strIngredient3
        case strIngredient4
        case strIngredient5
        case strIngredient6
        case strIngredient7
        case strIngredient8
        case strIngredient9
        case strIngredient10
        case strIngredient11
        case strIngredient12
        case strIngredient13
        case strIngredient14
        case strIngredient15
        case strIngredient16
        case strIngredient17
        case strIngredient18
        case strIngredient19
        case strIngredient20
        case instructions = "strInstructions"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.thumbnail = try container.decode(String.self, forKey: .thumbnail)
        self.category = try container.decode(String.self, forKey: .category)
        
        var ingredients: [String] = []
        for i in 1...20 {
            let ingredient = try container.decode(String.self, forKey: .init(stringValue: "strIngredient\(i)")!)
            if(!ingredient.isEmpty) {
                ingredients.append(ingredient)
            }
        }
        print(ingredients)
        self.ingredients = ingredients
        self.instructions = try container.decode(String.self, forKey: .instructions)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(thumbnail, forKey: .thumbnail)
        try container.encode(category, forKey: .category)
    }
}

struct MealRecordsModel: Codable {
    let meals: [MealModel]
}
