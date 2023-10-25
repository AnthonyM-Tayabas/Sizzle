//
//  RecipeCard.swift
//  Sizzle
//
//  Created by Renzy Ortega on 10/21/23.
//

import SwiftUI

struct RecipeCard: View {
    
    var meal: MealModel?
    
    var body: some View {
        NavigationLink(destination: RecipeView(meal: meal)) {
            VStack(alignment: .leading, spacing: 8) {
                RecipeImage(url: URL(string: "\(meal?.thumbnail ?? "")"))
                .frame(height: 180)
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(meal?.category ?? "-")
                            .font(.footerRegularSizzle)
                            .foregroundColor(Color(#colorLiteral(red: 0.07058823529, green: 0.5607843137, blue: 0.6823529412, alpha: 1)))
                        Text(meal?.name ?? "")
                            .font(.messageRegularSizzle)
                            .fontWeight(.medium)
                            .lineLimit(nil)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.black)
                    }
                }
                .padding()
            }
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(12)
        }
    }
}

struct RecipeCard_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCard()
    }
}
