//
//  IngredientRow.swift
//  Recipe Test 5
//
//  Created by Joel Salomonsson on 5/24/23.
//

import SwiftUI

struct IngredientRow: View {
    var name: String
    var unit: String
    var amount: Float
    
    var body: some View {
        HStack {
            Text(name)
                .font(.callout)
            Spacer()
            HStack(spacing: 4) {
                    Text(formatNumber(amount))
                        .font(.callout)
                        .fontWeight(.bold)
                        //.multilineTextAlignment(.trailing)
                        .frame(width: 36, alignment: .trailing)
                
                    Text(unit)
                        .font(.callout)
                        .foregroundColor(Color.secondary)
                        .multilineTextAlignment(.leading)
                        .frame(width: 40, alignment: .leading)
                
                
                //.background(Color.red)
            }
        }
    }
    
    
    
    func formatNumber(_ amount: Float) -> String {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = amount.truncatingRemainder(dividingBy: 2) == 0 ? 0 : 2
        return formatter.string(from: NSNumber(value: amount)) ?? ""
    }
}

struct IngredientRow_Previews: PreviewProvider {
    static var previews: some View {
        IngredientRow(name: "Ingredient, this is a long text to try things tiiiiiiiii", unit: "Tbsp", amount: 800)
    }
}
