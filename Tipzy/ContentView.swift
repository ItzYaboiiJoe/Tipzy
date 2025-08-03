
import SwiftUI

let QuickTip = [13,15,18,20]

struct ContentView: View {
    @EnvironmentObject var historyStore: HistoryStore
    
    @State private var price: Double?
    @State private var tipPercent: Double?
    @State private var tipAmount: Double?
    @State private var total: Double?

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Enter Total Price")) {
                        TextField(
                            "Total Price before tip",
                            value: $price,
                            format: .number
                        )
                        .keyboardType(.decimalPad)
                        .textFieldStyle(.roundedBorder)
                        .padding(.vertical, 4)
                    }

                    Section(header: Text("Enter how much tip %")) {
                        VStack(alignment: .leading, spacing: 8) {
                            TextField(
                                "Enter Tip %",
                                value: $tipPercent,
                                format: .number
                            )
                            .keyboardType(.decimalPad)
                            .textFieldStyle(.roundedBorder)
                            .padding(.bottom, 4)

                            HStack(spacing: 12) {
                                ForEach(QuickTip, id: \.self) { quickTip in
                                    Button(action: {
                                        self.tipPercent = Double(quickTip)
                                    }) {
                                        Text("\(quickTip)%")
                                            .frame(maxWidth: .infinity)
                                            .padding(.vertical, 6)
                                            .background(Color.blue.opacity(0.1))
                                            .foregroundColor(.blue)
                                            .cornerRadius(8)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .padding(.vertical, 4)
                    }

                    Section(header: Text("Results")) {
                        Text(tipAmount != nil ? String(format: "Tip: $%.2f", tipAmount!) : "Tip: ")
                            .font(.title2).bold()
                            .padding(.top, 10)
                        Text(total != nil ? String(format: "Total: $%.2f", total!) : "Total: ")
                            .font(.title2).bold()
                            .padding(.top, 10)}
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
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.1)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
            )
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: HistoryView()) {
                        Text("History")
                    }
                }
            }
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

        let entry = HistoryEntry(
            price: price,
            tipPercent: tipPercent,
            tipAmount: tip,
            total: total!
        )
        historyStore.entries.append(entry)
    }
}

#Preview {
    ContentView()
        .environmentObject(HistoryStore())
}
