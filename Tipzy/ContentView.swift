import SwiftUI

struct ContentView: View {
    @State private var price: Int?
    var body: some View {
        Form {
            Section(header: Text("Enter Total Price")){
                TextField(
                        "Total Price before tip",
                        value: $price,
                        format: .number
                    )
                .keyboardType(.numberPad)
            }
            Section(header: Text("Enter how much tip %")){
                TextField(
                        "How much tip %",
                        value: $price,
                        format: .number
                    )
                .keyboardType(.numberPad)
            }
        }
    }
}

#Preview {
    ContentView()
}
