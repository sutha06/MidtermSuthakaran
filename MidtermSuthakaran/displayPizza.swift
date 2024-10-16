//
//  displayPizza.swift
//  MidtermSuthakaran
//
//  Created by Suthakaran Siva on 2024-10-16.
//  991703674
//

import SwiftUI

struct DisplayPizza: View {
    @Binding var name: String
    @Binding var size: String
    @Binding var pepperoni: Bool
    @Binding var cheese: Bool
    @Binding var olive: Bool
    @Binding var quantity: Int
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Hi \(name)")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Pizza Size: \(size)")
            Text("Toppings:")
            Text("Pepperoni: \(pepperoni ? "Yes" : "No")")
            Text("Cheese: \(cheese ? "Yes" : "No")")
            Text("Olive: \(olive ? "Yes" : "No")")
            Text("Quantity: \(quantity)")
            
            // Calculate and display the price
            let price = calculatePrice()
            Text("Total Price: $\(price, specifier: "%.2f")")
                .font(.headline)
                .foregroundColor(.green)
        }
        .navigationTitle("Display Pizza")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
    
    // Helper function to calculate the price
    func calculatePrice() -> Double {
        var basePrice: Double = 0.0
        
        // Set base price based on size
        switch size {
        case "Small":
            basePrice = 10.0
        case "Medium":
            basePrice = 12.0
        case "Large":
            basePrice = 15.0
        default:
            basePrice = 0.0
        }
        
        // Multiply by quantity
        return basePrice * Double(quantity)
    }
}

#Preview {
    DisplayPizza(name: .constant("John"), size: .constant("Medium"), pepperoni: .constant(true), cheese: .constant(false), olive: .constant(true), quantity: .constant(2))
}
