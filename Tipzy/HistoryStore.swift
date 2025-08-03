import Foundation

class HistoryStore: ObservableObject {
    @Published var entries: [HistoryEntry] = []
}
