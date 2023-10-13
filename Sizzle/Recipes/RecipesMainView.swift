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

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Hello!")
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                    
                    Text("What would you like to cook today?")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    HStack(spacing: 16) {
                        HStack {
                            Image("search")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 18, height: 18)
                                .foregroundColor(.gray)
                            TextField("Search", text: $search)
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
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.categories?.categories ?? []) { category in
                                ZStack {
                                    Text(category.name)
                                        .font(.caption)
                                        .padding()
                                        .cornerRadius(8)
                                }
                                .background(.gray.opacity(0.1))
                            }
                        }
                    }
                    
                    // TODO: Use viewmodel to fetch random recipe
                    
                    ZStack {
                        VStack(alignment: .leading, spacing: 8) {
                            AsyncImage(url: URL(string: "https://www.themealdb.com/images/media/meals/qtqwwu1511792650.jpg")) { image in
                                image
                                    .resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(height: 180)
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Breakfast")
                                        .font(.caption)
                                        .foregroundColor(Color(#colorLiteral(red: 0.07058823529, green: 0.5607843137, blue: 0.6823529412, alpha: 1)))
                                    Text("Chinon Apple Tarts")
                                        .fontWeight(.medium)
                                        .lineLimit(nil)
                                        .multilineTextAlignment(.leading)
                                }
                            }
                            .padding()
                        }
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(12)
                    }
                    
                    ForEach(viewMealModel.meals?.meals ?? []) { meal in
                        ZStack {
                            VStack(alignment: .leading, spacing: 8) {
                                AsyncImage(url: URL(string: "\(meal.thumbnail)")) { image in
                                    image
                                        .resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(height: 180)
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Breakfast")
                                            .font(.caption)
                                            .foregroundColor(Color(#colorLiteral(red: 0.07058823529, green: 0.5607843137, blue: 0.6823529412, alpha: 1)))
                                        Text("\(meal.name)")
                                            .fontWeight(.medium)
                                            .lineLimit(nil)
                                            .multilineTextAlignment(.leading)
                                    }
                                }
                                .padding()
                            }
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(12)
                        }
                        .background(.gray.opacity(0.1))
                    }
                }
            }
            .padding([.trailing, .leading], 20)
            .background(.gray.opacity(0.1))
            .onAppear {
                Task {
                    await viewModel.fetchCategories()
                }
            }
            .onSubmit {
                Task {
                    await viewMealModel.fetchMeals(searchName: search)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct RecipesMainView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesMainView()
    }
}
