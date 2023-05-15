//
//  Ingredient.swift
//  Recipe Test 5
//
//  Created by Joel Salomonsson on 5/14/23.
//

import Foundation
import Contentful

final class Ingredient: EntryDecodable, FieldKeysQueryable, Identifiable {
  enum FieldKeys: String, CodingKey {
    case unit
    case name, amount
  }

  static let contentTypeId: String = "ingredient"

  // FlatResource members.
  let id: String
  let localeCode: String?
  let updatedAt: Date?
  let createdAt: Date?

  let name: String
  let amount: Float
  var unit: Unit?

  public required init(from decoder: Decoder) throws {
    let sys         = try decoder.sys()

    id              = sys.id
    localeCode      = sys.locale
    updatedAt       = sys.updatedAt
    createdAt       = sys.createdAt

    let fields      = try decoder.contentfulFieldsContainer(keyedBy: Ingredient.FieldKeys.self)

    self.name       = try fields.decode(String.self, forKey: .name)
    self.amount     = try fields.decode(Float.self, forKey: .amount)

    try fields.resolveLink(forKey: .unit, decoder: decoder) { [weak self] unit in
      self?.unit = unit as? Unit
    }
  }
}
