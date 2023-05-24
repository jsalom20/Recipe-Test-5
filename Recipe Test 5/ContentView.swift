//
//  ContentView.swift
//  Recipe Test 5
//
//  Created by Joel Salomonsson on 5/11/23.
//

import SwiftUI
import Contentful

struct ContentView: View {
    //@State private var recipes: [Recipe] = []
    @State private var categories: [String] = []
    
    @StateObject var store = RecipeStore()
    
    var body: some View {
        TabView {
            HomeView(store: store)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Recipes")
                }
            RecipeListView(store: store)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Recipes")
                }
            
            CategoryListView(categories: categories)
                .tabItem {
                    Image(systemName: "tag")
                    Text("Categories")
                }
        }
    }
}



