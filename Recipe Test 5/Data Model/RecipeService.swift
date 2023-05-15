//
//  RecipeService.swift
//  Recipe Test 5
//
//  Created by Joel Salomonsson on 5/11/23.
//
import SwiftUI
import Foundation
import Contentful

let spaceId = "1yns9htp3ulv"
let accessToken = "HlCfLg8N4chIsBVCaaUEkLjunLFv2X_56zAP2HpeIpM"
let contentTypeClasses: [EntryDecodable.Type] = [Unit.self, Ingredient.self, IngredientSection.self, Recipe.self, Category.self]
let client = Client(spaceId: spaceId, accessToken: accessToken, contentTypeClasses: contentTypeClasses)


func getArray(id: String, completion: @escaping([Recipe]) -> ()) {
    let query = QueryOn<Recipe>.where(contentTypeId: id)
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
                //print("Hello world")
               // print(items.first?.category?)
               // print(items.count)
               // print(items.first?.description)
               // print(items.last?.image?.url)
               // print(items.last?.category?.id)
               // print(items.last?.ingredientSections?.first?.name)
            }
        }
    }
    
}

//https://cdn.contentful.com/spaces/{1yns9htp3ulv}/environments/{master}/entries/{6RZNdafGIFTtSSUoy5FK6B}?access_token={HlCfLg8N4chIsBVCaaUEkLjunLFv2X_56zAP2HpeIpM}
//https://cdn.contentful.com/spaces/1yns9htp3ulv/environments/master/entries/5968LMHVACuBkPpitqvNnC?access_token=HlCfLg8N4chIsBVCaaUEkLjunLFv2X_56zAP2HpeIpM

