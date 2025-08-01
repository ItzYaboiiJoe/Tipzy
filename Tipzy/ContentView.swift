import SwiftUI

struct ContentView: View {
    @State private var price: Double?
    @State private var tipPercent: Double?
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
                    .textFieldStyle(.roundedBorder)
                    .padding(.vertical, 4)
                }

                Section(header: Text("Enter how much tip %")) {
                    TextField(
                        "How much tip %",
                        value: $tipPercent,
                        format: .number
                    )
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)
                    .padding(.vertical, 4)
                }

                Section(header: Text("Results")) {
                    Text(tipAmount != nil ? String(format: "Tip: $%.2f", tipAmount!) : "Tip: ")
                        .font(.title2).bold()
                        .padding(.top, 10)
                    Text(total != nil ? String(format: "Total: $%.2f", total!) : "Total: ")
                        .font(.title2).bold()
                        .padding(.top, 10)                }
            }
            
            Button(action: calulateTip) {
                Text("Calculate")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.9))
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .shadow(color: .gray.opacity(0.3), radius: 3, x: 0, y: 2)
            }
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
