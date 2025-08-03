import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var historyStore: HistoryStore

    var body: some View {
        List(historyStore.entries.reversed()) { entry in
            VStack(alignment: .leading) {
                Text(String(format: "Price: $%.2f", entry.price))
                Text(String(format: "Tip: %.0f%% ($%.2f)", entry.tipPercent, entry.tipAmount))
                Text(String(format: "Total: $%.2f", entry.total))
            }
            .padding(.vertical, 4)
        }
        .navigationTitle("Tip History")
    }
}

#Preview {
    HistoryView()
        .environmentObject(HistoryStore())
}
