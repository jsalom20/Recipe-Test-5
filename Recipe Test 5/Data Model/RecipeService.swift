//
//  RecipeService.swift
//  Recipe Test 5
//
//  Created by Joel Salomonsson on 5/11/23.
//
import SwiftUI
import Foundation
import Contentful


let contentTypeClasses: [EntryDecodable.Type] = [Unit.self, Ingredient.self, IngredientsSection.self, Recipe.self, Category.self]
let client = Client(spaceId: spaceId, accessToken: accessToken, contentTypeClasses: contentTypeClasses)


func getArray(id: String, completion: @escaping([Recipe]) -> ()) {
    let query = QueryOn<Recipe>.where(contentTypeId: id)
    query.include(5)
    try! query.order(by: Ordering(sys: .createdAt, inReverse: true)) // ordering the list of articles by created date
    
    client.fetchArray(of: Recipe.self, matching: query) { result in
        switch result {
        case .success(let array):
            DispatchQueue.main.async {
                completion(array.items)
            }
        case .failure(let error):
            print(error)
        }
    }
}



class RecipeStore: ObservableObject {
    @Published var recipes: [Recipe] = []
    
    init() {
        DispatchQueue.main.async {
            self.refreshView()
        }
    }
    
    
    func refreshView() {
        //recipes = []
        DispatchQueue.main.async {
            getArray(id: "recipe")  { items in
                self.recipes = items
            }
        }
    }
    
}

