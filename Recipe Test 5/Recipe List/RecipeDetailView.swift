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
            VStack(alignment: .center, spacing: 24) {
                
                
                
                //Image and Tags
                VStack(alignment: .leading, spacing: 8.0) {
                    //Image
                    if let imageURL = recipe.image?.url {
                        AsyncImage(url: imageURL) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 200)
                                .frame(maxWidth: 500)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        } placeholder: {
                            ProgressView()
                                .frame(height: 200)
                                .frame(maxWidth: .infinity)
                        }
                    }
                    
                    //tags
                    VStack(alignment: .leading){
                        if let tags = recipe.tags {
                            HStack {
                                ForEach(tags, id: \.self) { tag in
                                    ChipSmall(label: tag)
                                }
                            }
                        }
                    }
                }
                
                //Name
                VStack(alignment: .leading, spacing: 8) {
                    Text(recipe.name)
                        //.font(.title)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.bold)
                    
                    //Description
                    if let description = recipe.description {
                        Text(description)
                           // .font(.subheadline)
                            .font(.system(.subheadline, design: .serif))
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                    }
                }
                .frame(minWidth: 200, maxWidth: .infinity)
                
                
                //Ingredient Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("Ingredients")
                        .fontWeight(.medium)
                        .font(.system(.title3, design: .rounded))
                    
                    VStack(spacing: 16) {
                        ForEach(recipe.ingredientSections ?? []) { ingredientSection in
                            VStack(alignment: .leading, spacing: 8) {
                                Text(ingredientSection.name)
                                    .fontWeight(.bold)
                                    .font(.system(.subheadline, design: .rounded))
                                
                                VStack(spacing: 4) {
                                    ForEach(ingredientSection.ingredients ?? []) { ingredient in
                                        IngredientRow(name: ingredient.name, unit: ingredient.unit?.name ?? "", amount: ingredient.amount)
                                    }
                                }
                            }
                        }
                    }
                }
                
                //Instructions
                VStack(alignment: .leading, spacing: 8.0) {
                    Text("Instructions")
                        .fontWeight(.bold)
                        .font(.system(.title3, design: .rounded))
                    .padding(.top)
                    
                    Text(recipe.instructionsLocalized)
                        .font(.callout)
                }
                
                //Category
               // if let categoryName = recipe.category?.name {
                 //   Text("Category: \(categoryName)")
                   //     .padding(.bottom)
                //}
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .navigationBarTitleDisplayMode(.inline)
            .padding(.horizontal)
        }
    }
}
