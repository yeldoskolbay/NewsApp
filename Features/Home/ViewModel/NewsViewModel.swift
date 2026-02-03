

import Foundation

@MainActor
final class NewsViewModel: ObservableObject {
    private let network = NetworkManager()

    
    @Published var articles: [Article] = []
    @Published var isLoading: Bool = false
    @Published var errorText : String?
    
    
    @Published var searchText: String = ""
    @Published var selectedCategory: NewsCategory = .general
    
    func loadTop() async {
        isLoading = true
        errorText = nil
        defer { isLoading = false }
        
        do {
            articles = try await network.fetchEverything(query: selectedCategory.query, language: "ru")
        } catch {
            errorText = error.localizedDescription
            articles = []
        }
    }
    
    func search() async {
        let q = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !q.isEmpty else {
            await loadTop()
            return
        }
        
        isLoading = true
        errorText = nil
        defer { isLoading = false }
        
        do {
            articles = try await network.fetchEverything(query: q, language: "ru")
        } catch {
            errorText = error.localizedDescription
            articles = []
        }
    }
    
    
    func selectCategory(_ category: NewsCategory) {
        selectedCategory = category
    }
}
