//
//  CategoryRecipeListView.swift
//  Recipe Test 5
//
//  Created by Joel Salomonsson on 5/12/23.
//

import SwiftUI

struct CategoryRecipeListView: View {
    var category: String
    var recipes: [Recipe]

    var body: some View {
        
        Text("Test")
//        List(recipes.filter { $0.category.contains(category) }) { recipe in
//            NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
//                Text(recipe.name)
//            }
//        }
//        .navigationTitle(category)
    }
}
