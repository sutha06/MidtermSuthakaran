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
                .font(.system(size: 35))
            Text("Your Order Details:")
                .font(.system(size: 35))
            
            Text("\(size) Pizza")
                .font(.system(size: 35))
            Text("Toppings:")
                .font(.system(size: 35))
            Text("Pepperoni: \(pepperoni ? "Yes" : "No")")
            Text("Cheese: \(cheese ? "Yes" : "No")")
            Text("Olive: \(olive ? "Yes" : "No")")
            Text("Quantity: \(quantity)")
                .font(.system(size: 35))
            
            // Calculate and display the price
            let price = calculatePrice()
            Text("Total Price: $\(price, specifier: "%.2f")")
                .font(.system(size: 35))
        }
        .navigationTitle("Display Pizza")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
    
    // Helper function to calculate the price
    func calculatePrice() -> Double {
        var basePrice: Double = 0.0
        
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
    
    // this function is to check the toppings, but i didnt make it in time
    func whichToppings(pepperoni: Bool, cheese: Bool, olive: Bool) -> String {
        var toppings: [String] = []
        
        if pepperoni { toppings.append("Pepperoni") }
        if cheese { toppings.append("Cheese") }
        if olive { toppings.append("Olive") }
        else { toppings.append("None") }
        
        return toppings.joined(separator: ", ")
    }
}

#Preview {
    DisplayPizza(name: .constant("John"), size: .constant("Medium"), pepperoni: .constant(true), cheese: .constant(false), olive: .constant(true), quantity: .constant(2))
}
