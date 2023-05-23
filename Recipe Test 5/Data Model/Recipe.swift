//
//  Recipe.swift
//  Recipe Test 5
//
//  Created by Joel Salomonsson on 5/11/23.
//

import Foundation
import Contentful

final class Recipe: EntryDecodable, FieldKeysQueryable, Identifiable {
    enum FieldKeys: String, CodingKey {
        case name, description, tags, image, instructions
        case ingredientSections, category
    }
    
    static let contentTypeId: String = "recipe"
    
    // FlatResource members.
    let id: String
    let localeCode: String?
    let updatedAt: Date?
    let createdAt: Date?
    
    let name: String
    let description: String?
    let tags: [String]?
    var image: Asset?
    let instructions: String
    var ingredientSections: [IngredientsSection]?
    var category: Category?
    
    public required init(from decoder: Decoder) throws {
        let sys         = try decoder.sys()
        
        id                  = sys.id
        localeCode          = sys.locale
        updatedAt           = sys.updatedAt
        createdAt           = sys.createdAt
        
        let fields          = try decoder.contentfulFieldsContainer(keyedBy: Recipe.FieldKeys.self)
        
        self.name           = try fields.decode(String.self, forKey: .name)
        self.description    = try fields.decodeIfPresent(String.self, forKey: .description)
        self.tags           = try fields.decodeIfPresent(Array<String>.self, forKey: .tags)
        self.instructions   = try fields.decode(String.self, forKey: .instructions)
        
        
        //Image
        try fields.resolveLink(forKey: .image, decoder: decoder) { [weak self] image in
            self?.image = image as? Asset
        }
        
        //IngredientSection
        try fields.resolveLinksArray(forKey: .ingredientSections, decoder: decoder) { [weak self] ingredientSections in
            self?.ingredientSections = ingredientSections as? [IngredientsSection]
        }
        
        //Category
        try fields.resolveLink(forKey: .category, decoder: decoder) { [weak self] category in
            self?.category = category as? Category
        }
    }
}

