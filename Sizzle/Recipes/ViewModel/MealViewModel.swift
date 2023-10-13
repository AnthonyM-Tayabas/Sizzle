//
//  MealViewModel.swift
//  Sizzle
//
//  Created by Zalie Christian Amaranto on 10/13/23.
//

import Foundation

class MealViewModel: ObservableObject {
    @Published var meals: MealRecordsModel?
    
    func fetchMeals(searchName: String) async {
        do {
            let (data, _) = try await RecipeAPI.shared.getMeals(search: searchName)
            let decodedRecords = try? JSONDecoder().decode(MealRecordsModel.self, from: data)
            if(decodedRecords != nil) {
                DispatchQueue.main.async {
                    self.meals = decodedRecords
                }
            }
        }
        catch {
            print(error)
        }
    }
}
