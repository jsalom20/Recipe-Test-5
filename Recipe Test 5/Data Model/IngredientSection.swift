//
//  IngredientSection.swift
//  Recipe Test 5
//
//  Created by Joel Salomonsson on 5/14/23.
//

import Foundation
import Contentful

final class IngredientSection: EntryDecodable, FieldKeysQueryable, Identifiable {
    enum FieldKeys: String, CodingKey {
        case name
        case ingredients
    }
    
    static let contentTypeId: String = "ingredientSection"
    
    // FlatResource members.
    let id: String
    let localeCode: String?
    let updatedAt: Date?
    let createdAt: Date?
    
    let name: String
    var ingredients: [Ingredient]?
    
    public required init(from decoder: Decoder) throws {
        let sys         = try decoder.sys()
        
        id              = sys.id
        localeCode      = sys.locale
        updatedAt       = sys.updatedAt
        createdAt       = sys.createdAt
        
        let fields      = try decoder.contentfulFieldsContainer(keyedBy: IngredientSection.FieldKeys.self)
        
        self.name       = try fields.decode(String.self, forKey: .name)
        if let ingredients = try fields.decodeIfPresent([Ingredient].self, forKey: .ingredients) {
            self.ingredients = ingredients
        } else {
            print("No ingredients found for ingredient section: \(id)")
        }
        //self.ingredients = try fields.decodeIfPresent([Ingredient].self, forKey: .ingredients)
        
        
        do {
            try fields.resolveLinksArray(forKey: .ingredients, decoder: decoder) { [weak self] ingredients in
                self?.ingredients = ingredients as? [Ingredient]
            }
        } catch {
            // Handle the error here
            print("Error resolving links for ingredients: \(error)")
            self.ingredients = nil // or any other error handling logic
        }
        
        // Print the data for debugging
        print("Ingredient Section:")
        print("ID: \(id)")
        print("Name: \(name)")
        print("Ingredients: \(ingredients ?? [])")
        
        
        
    }
}
