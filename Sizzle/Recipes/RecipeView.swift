//
//  RecipeView.swift
//  Sizzle
//
//  Created by Renzy Ortega on 10/20/23.
//

import SwiftUI

struct RecipeView: View {
    @Environment(\.dismiss) var dismiss
    var meal: MealModel?
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading, spacing: 2) {
                GeometryReader { reader -> AnyView in
                    
                    AnyView(
                        RecipeImage(url: URL(string: "\(meal!.thumbnail)"))
                        .overlay(
                            HStack {
                                Button(action: {
                                    dismiss()
                                }, label: {
                                    Image(systemName: "arrow.left")
                                        .font(.system(size: 20))
                                        .foregroundColor(.black)
                                        .padding(4)
                                })
                                .background(.white)
                                .cornerRadius(40)
                                
                                Spacer()
                            }
                            .padding(),
                            alignment: .top
                    ))
                }
                .frame(height: 260)
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text(meal!.name)
                        .font(.bodyRegularSizzle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Divider()
                    
                    Text("Instructions")
                        .font(.headlineRegularSizzle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text(meal?.instructions ?? "-")
                        .font(.descriptionRegularSizzle)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                    
                    Text("Ingredients")
                        .font(.headlineRegularSizzle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        ForEach(meal?.ingredients ?? [], id: \.self) { ingredient in
                            Text(ingredient)
                                .font(.descriptionRegularSizzle)
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}
