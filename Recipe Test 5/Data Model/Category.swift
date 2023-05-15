//
//  Category.swift
//  Recipe Test 5
//
//  Created by Joel Salomonsson on 5/14/23.
//

import Foundation
import Contentful

final class Category: EntryDecodable, FieldKeysQueryable, Identifiable {
  enum FieldKeys: String, CodingKey {
    case name
  }

  static let contentTypeId: String = "category"

  // FlatResource members.
  let id: String
  let localeCode: String?
  let updatedAt: Date?
  let createdAt: Date?

  let name: String

  public required init(from decoder: Decoder) throws {
    let sys         = try decoder.sys()

    id              = sys.id
    localeCode      = sys.locale
    updatedAt       = sys.updatedAt
    createdAt       = sys.createdAt

    let fields      = try decoder.contentfulFieldsContainer(keyedBy: Category.FieldKeys.self)

      self.name       = try fields.decodeIfPresent(String.self, forKey: .name)!

  }
}
