//
//  ContentView.swift
//  MidtermSuthakaran
//
//  Created by Suthakaran Siva on 2024-10-16.
//  991703674
//

// Suthakaran
import SwiftUI

struct ContentView: View {
    
    @State var sizes = ["Small", "Medium", "Large"]
    @State private var selectedSize = "Medium"

    @State var userName = ""
    @State var choosePepperoni: Bool = false
    @State var chooseCheese: Bool = false
    @State var chooseOlive: Bool = false
    @State var chooseQuantity: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 15) {
                
                Text("Midterm Exam")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Order View")
                    .font(.system(size: 30))
                    .multilineTextAlignment(.center)
                    
                TextField("User First Name", text: $userName)
                    .border(.blue)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("Select Pizza Size:")
                    .font(.headline)
                
                Picker("Select Pizza Size", selection: $selectedSize) {
                    ForEach(sizes, id: \.self) { size in
                        Text(size)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Text("Select Pizza Topping:")
                    .font(.headline)
                
                Toggle("Cheese", isOn: $chooseCheese)
                Toggle("Pepperoni", isOn: $choosePepperoni)
                Toggle("Olive", isOn: $chooseOlive)
                
                TextField("Enter number of Pizzas", text: $chooseQuantity)
                    .border(.blue)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                if !isValidSelection() {
                    Text("Please put your name, select a size, and choose quantity")
                        .foregroundColor(.red)
                            }
            
                NavigationLink(destination: DisplayPizza(
                    name: $userName,
                    size: $selectedSize,
                    pepperoni: $choosePepperoni,
                    cheese: $chooseCheese,
                    olive: $chooseOlive,
                    quantity: Binding(
                        get: { Int(chooseQuantity) ?? 0 },
                        set: { chooseQuantity = "\($0)" }
                    )
                )) {
                    Text("Place the Order")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .padding()
        }
    }
    func isValidSelection() -> Bool {
        return
        userName != "" &&
        selectedSize != "Select Size" &&
        chooseQuantity != ""
    }
}

#Preview {
    ContentView()
}
