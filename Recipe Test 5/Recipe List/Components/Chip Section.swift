//
//  Chip Section.swift
//  Recipe Test 5
//
//  Created by Joel Salomonsson on 5/17/23.
//

import SwiftUI

struct Chip_Section: View {
    var chipLabel: String
    var title: String
    
    var body: some View {
        VStack {
            Text(title)
            
            HStack {
                Chip(label: chipLabel)

            }
        }
    }
}

struct Chip_Section_Previews: PreviewProvider {
    static var previews: some View {
        Chip_Section(chipLabel: "Test", title: "Section Title")
    }
}
