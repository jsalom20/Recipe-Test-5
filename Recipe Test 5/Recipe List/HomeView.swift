//
//  HomeView.swift
//  Recipe Test 5
//
//  Created by Joel Salomonsson on 5/24/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var store: RecipeStore
    
    var categories: Array = ["Breakfast", "Lunch", "Dinner", "Dessert"]
    
    let columns = [
            GridItem(.adaptive(minimum: 150 , maximum: 200), spacing: 16)
        ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                ScrollView(.horizontal){
                   
                        VStack{
                            Text("🍰")
                            Text("Dessert")
                        }
                }
                
                
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(store.recipes) { recipe in
                        RecipeCard(recipe: recipe)
                            //.aspectRatio(contentMode: .fill)
                            //.padding(.horizontal, 8)
                            //.frame(maxWidth: .infinity)
                    }
                }
                //.frame(maxWidth: .infinity)
                
            }
            .padding(.horizontal)
            .navigationTitle("Recipes")
            .refreshable {
                store.refreshView()
            }
        }
        
    }
}

