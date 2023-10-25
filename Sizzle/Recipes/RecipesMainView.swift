//
//  RecipesMainView.swift
//  Sizzle
//
//  Created by Tayabas, Anthony Mark (Cognizant) on 9/21/23.
//

import SwiftUI

struct RecipesMainView: View {
    
    @ObservedObject private var viewModel = CategoryViewModel()
    @ObservedObject private var viewMealModel = MealViewModel()
    @State private var search: String = ""
    @State private var searchSubmitted = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("What would you like to cook today?")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    HStack(spacing: 16) {
                        HStack {
                            Image("search")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 18, height: 18)
                                .foregroundColor(.gray)
                            TextField("Search", text: $search)
                                .foregroundColor(.black)
                                .onSubmit {
                                    searchSubmitted = true
                                    Task {
                                        await viewMealModel.fetchMeals(searchName: search)
                                    }
                                }
                        }
                        .padding()
                        .background(.gray.opacity(0.1))
                        .cornerRadius(8)
                        
                        Image("filter")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18, height: 18)
                            .padding()
                            .background(.gray.opacity(0.1))
                            .cornerRadius(8)
                    }
                    
                    Text("Categories")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.black)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.categories?.categories ?? []) { category in
                                ZStack {
                                    Text(category.name)
                                        .font(.caption)
                                        .padding()
                                        .cornerRadius(8)
                                        .foregroundColor(.black)
                                }
                                .background(.gray.opacity(0.1))
                            }
                        }
                    }
                    
                    // TODO: Use viewmodel to fetch random recipe
                    
                    if searchSubmitted {
                        Text("Found \((viewMealModel.meals?.meals ?? []).count) results")
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                        
                        ForEach(viewMealModel.meals?.meals ?? []) { meal in
                            ZStack {
                                RecipeCard(meal: meal)
                            }
                            .background(.gray.opacity(0.1))
                        }
                    }
                    else {
                        if viewMealModel.loadingRandomMeal {
                            Loader()
                        }
                        else {
                            ZStack {
                                RecipeCard(meal: viewMealModel.randomMeal)
                            }
                        }
                    }
                }
            }
            .padding([.trailing, .leading], 20)
            .background(.gray.opacity(0.1))
            .onAppear {
                Task {
                    if viewModel.categories == nil {
                        await viewModel.fetchCategories()
                    }
                    if viewMealModel.randomMeal == nil {
                        await viewMealModel.fetchRandomMeal()
                    }
                }
            }
        }
    }
}


struct RecipeImage: View {
    let url: URL?
        
    init(url: URL?) {
        self.url = url
    }
    
    var body: some View {
        if let url = url {
            AsyncImage(url: url) { phase in
                switch phase {
                    case .empty:
                        Color.gray
                    case .success(let image):
                        image.resizable()
                    case .failure:
                        Color.gray
                    @unknown default:
                        EmptyView()
                }
            }
        } else {
            Color.gray
        }
    }
}

struct RecipesMainView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesMainView()
    }
}
