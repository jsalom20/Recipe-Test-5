//
//  RecipeListView.swift
//  Recipe Test 5
//
//  Created by Joel Salomonsson on 5/12/23.
//

import SwiftUI

struct RecipeListView: View {
    @ObservedObject var store: RecipeStore

    var body: some View {
        NavigationView {
            List(store.recipes) { recipe in
                NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                    HStack {
                        if let imageURL = recipe.image?.url {
                            AsyncImage(url: imageURL) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(8)
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 60, height: 60)
                            }
                        } else {
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 60)
                                .cornerRadius(8)
                        }
                        
                        VStack(alignment: .leading) {
                            Text(recipe.name)
                                .font(.headline)
                            Text(recipe.description ?? "")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .lineLimit(1)
                        }
                    }
                }
            }
            .navigationTitle("Recipes")
        }
    }
}
