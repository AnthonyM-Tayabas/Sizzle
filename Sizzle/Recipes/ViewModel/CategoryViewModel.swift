//
//  CategoryViewModel.swift
//  Sizzle
//
//  Created by Renzy Ortega on 10/4/23.
//

import Foundation

class CategoryViewModel: ObservableObject {
    @Published var categories: CategoryRecordsModel?
    
    func fetchCategories() async {
        do {
            let (data, _) = try await RecipeAPI.shared.getCategories()
            let decodedRecords = try? JSONDecoder().decode(CategoryRecordsModel.self, from: data)
            if(decodedRecords != nil) {
                DispatchQueue.main.async {
                    self.categories = decodedRecords
                }
            }
        }
        catch {
            print(error)
        }
    }
    
}
