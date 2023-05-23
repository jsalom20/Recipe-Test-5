//
//  CategoryChip.swift
//  Recipe Test 5
//
//  Created by Joel Salomonsson on 5/17/23.
//

import SwiftUI

struct Chip: View {
    var label: String
    var body: some View {
        Text(label)
            .font(.callout)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(Color.accentColor.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

struct Chip_Previews: PreviewProvider {
    static var previews: some View {
        Chip(label: "Category")
    }
}
