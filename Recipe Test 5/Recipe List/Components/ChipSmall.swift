//
//  ChipSmall.swift
//  Recipe Test 5
//
//  Created by Joel Salomonsson on 5/18/23.
//

import SwiftUI

struct ChipSmall: View {
    var label: String
    var body: some View {
        Text(label)
            .font(.caption2)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Color.accentColor.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

struct ChipSmall_Previews: PreviewProvider {
    static var previews: some View {
        ChipSmall(label: "Category")
    }
}
