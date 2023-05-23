//
//  RecipeDetailView.swift
//  Recipe Test 5
//
//  Created by Joel Salomonsson on 5/12/23.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    
    let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
            return formatter
        }()
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                //Image
                if let imageURL = recipe.image?.url {
                    AsyncImage(url: imageURL) { image in
                        image
                            .resizable()
                            //.aspectRatio(contentMode: .fit)
                            .frame(height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    } placeholder: {
                        ProgressView()
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                    }
                }
                
                //Tags
                VStack(alignment: .leading){
                    if let tags = recipe.tags {
                        //Text("Tags")
                            //.font(.footnote)
                           // .padding(.top)
                        
                        HStack {
                            ForEach(tags, id: \.self) { tag in
                                ChipSmall(label: tag)
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
                            .font(.subheadline)
                            //.font(.system(.subheadline, design: .rounded))
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.leading)
                    }
                }
                .frame(minWidth: 200, maxWidth: .infinity)
                
                
                //Ingredient Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("Ingredients")
                        //.font(.title3)
                        .fontWeight(.bold)
                        .font(.system(.title3, design: .rounded))
                    
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
                VStack(alignment: .leading, spacing: 8.0) {
                    Text("Instructions")
                        .font(.headline)
                    .padding(.top)
                    
                    Text(recipe.instructionsLocalized)
                        .font(.callout)
                }
                
                //Category
                if let categoryName = recipe.category?.name {
                    Text("Category: \(categoryName)")
                        .padding(.bottom)
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .navigationBarTitleDisplayMode(.inline)
            .padding(.horizontal)
        }
    }
}
