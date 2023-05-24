//
//  RecipeCard.swift
//  Recipe Test 5
//
//  Created by Joel Salomonsson on 5/24/23.
//

import SwiftUI

struct RecipeCard: View {
    
    let recipe: Recipe
    // @State private var isShowingDetail = false
    
    var body: some View {
        NavigationLink(
            destination: RecipeDetailView(recipe: recipe),
            //isActive: $isShowingDetail,
            label: {
                VStack(alignment: .leading) {
                    if let imageURL = recipe.image?.url {
                        AsyncImage(url: imageURL) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(minWidth: 100, maxWidth: .infinity)
                                .frame(height: 150)
                                .cornerRadius(8)
                            
                        } placeholder: {
                            ProgressView()
                            
                                .cornerRadius(8)
                        }
                    } else {
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 150)
                            .cornerRadius(8)
                    }
                    
                    Text(recipe.name)
                        .font(.callout)
                        .fontWeight(.bold)
                }
                //.frame(maxWidth: 200) // Set maximum width for the card
            }
        )
        .buttonStyle(PlainButtonStyle())
    }
}
