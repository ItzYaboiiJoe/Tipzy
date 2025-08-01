import SwiftUI

struct ContentView: View {
    @State private var price: Int?
    @State private var tipPercent: Int?
    @State private var tipAmount: Double?
    @State private var total: Double?

    var body: some View {
        VStack {
            Form {
                Section(header: Text("Enter Total Price")) {
                    TextField(
                        "Total Price before tip",
                        value: $price,
                        format: .number
                    )
                    .keyboardType(.numberPad)
                }

                Section(header: Text("Enter how much tip %")) {
                    TextField(
                        "How much tip %",
                        value: $tipPercent,
                        format: .number
                    )
                    .keyboardType(.numberPad)
                }
            }
            Text(tipAmount != nil ? String(format: "Tip: $%.2f", tipAmount!) : "Tip: --")
            Text(tipAmount != nil ? String(format: "Total: $%.2f", total!) : "Total: --")
            
            Button(action: calulateTip) {
                Text("Calculate")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.horizontal)
        }
    }
    //Calculation function
    func calulateTip(){
        guard let price = price, let tipPercent = tipPercent else {
            return
        }
        let tip = Double(price) * (Double(tipPercent) / 100)
        tipAmount = tip
        total = Double(price) + tip
    }
}

#Preview {
    ContentView()
}
