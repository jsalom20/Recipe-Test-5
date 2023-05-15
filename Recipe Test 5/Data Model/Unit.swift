//
//  Unit.swift
//  Recipe Test 5
//
//  Created by Joel Salomonsson on 5/14/23.
//

import Contentful
import Foundation

final class Unit: EntryDecodable, FieldKeysQueryable, Identifiable {
  enum FieldKeys: String, CodingKey {
    case name, type
  }

  static let contentTypeId: String = "unit"

  // FlatResource members.
  let id: String
  let localeCode: String?
  let updatedAt: Date?
  let createdAt: Date?

  let name: String
  let type: String

  public required init(from decoder: Decoder) throws {
    let sys         = try decoder.sys()

    id              = sys.id
    localeCode      = sys.locale
    updatedAt       = sys.updatedAt
    createdAt       = sys.createdAt

    let fields      = try decoder.contentfulFieldsContainer(keyedBy: Unit.FieldKeys.self)

    self.name       = try fields.decode(String.self, forKey: .name)
    self.type       = try fields.decode(String.self, forKey: .type)
  }
}
