import Foundation

struct HistoryEntry: Identifiable {
    let id = UUID()
    let price: Double
    let tipPercent: Double
    let tipAmount: Double
    let total: Double
}
