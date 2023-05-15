//
//  RecipeDetailView.swift
//  Recipe Test 5
//
//  Created by Joel Salomonsson on 5/12/23.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                if let imageURL = recipe.image?.url {
                    AsyncImage(url: imageURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: 200)
                    } placeholder: {
                        ProgressView()
                            .frame(maxHeight: 200)
                    }
                }
                
                //Name
                Text(recipe.name)
                    .font(.title)
                
                //Description
                if let description = recipe.description {
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                
                //Category
                if let categoryName = recipe.category?.name {
                    Text("Category: \(categoryName)")
                        .padding(.bottom)
                }
                
                
                if let tags = recipe.tags {
                    Text("Tags")
                        .font(.headline)
                        .padding(.top)
                    
                    HStack {
                        ForEach(tags, id: \.self) { tag in
                            Text(tag)
                                .padding(.bottom, 4)
                                .background(Color.red)
                        }
                    }
                }
                
                //Ingredient Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("Ingredients")
                        .font(.headline)
                    
                    ForEach(recipe.ingredientSections ?? []) { ingredientSection in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(ingredientSection.name)
                                .font(.subheadline)
                                .fontWeight(.bold)
                            
                            ForEach(ingredientSection.ingredients ?? []) { ingredient in
                                HStack {
                                    Text(ingredient.name)
                                    Text("\(ingredient.amount)")
                                    Text(ingredient.unit?.name ?? "")
                                }
                            }
                        }
                    }
                }
                
                //Instructions
                Text("Instructions")
                    .font(.headline)
                    .padding(.top)
                
                Text(recipe.instructions)
                    .padding()
                
                Spacer()
            }
            .padding()
            
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

