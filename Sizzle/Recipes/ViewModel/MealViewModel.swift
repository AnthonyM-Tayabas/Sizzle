//
//  MealViewModel.swift
//  Sizzle
//
//  Created by Zalie Christian Amaranto on 10/13/23.
//

import Foundation

class MealViewModel: ObservableObject {
    @Published var meals: MealRecordsModel?
    @Published var randomMeal: MealModel?
    
    @Published var loadingMeals = false
    @Published var loadingRandomMeal = false
    
    func fetchMeals(searchName: String) async {
        do {
            self.loadingMeals = true
            let (data, _) = try await RecipeAPI.shared.getMeals(search: searchName)
            let decodedRecords = try? JSONDecoder().decode(MealRecordsModel.self, from: data)
            if(decodedRecords != nil) {
                DispatchQueue.main.async {
                    self.meals = decodedRecords
                    self.loadingMeals = false
                }
            }
        }
        catch {
            self.loadingMeals = false
        }
    }
    
    func fetchRandomMeal() async {
        do {
            let (data, _) = try await RecipeAPI.shared.getRandomMeal()
            let decodedRecords = try? JSONDecoder().decode(MealRecordsModel.self, from: data)
            if(decodedRecords != nil) {
                DispatchQueue.main.async {
                    self.randomMeal = decodedRecords?.meals[0]
                    self.loadingRandomMeal = false
                }
            }
        }
        catch {
            self.loadingRandomMeal = false
        }
    }
}
