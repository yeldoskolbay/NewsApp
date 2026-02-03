

import SwiftUI


@MainActor
final class SearchViewModel: ObservableObject {
    @Published var query: String = ""
    @Published var articles: [Article] = []
    @Published var isLoading: Bool = false
    @Published var errorText: String?
    
    private let network : NetworkManager
    
    init(network: NetworkManager = NetworkManager()) {
        self.network = network
    }
    
    func search() async {
        let trimmed = query.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else {
            articles = []
            errorText = nil
            return
        }
        
        isLoading = true
        errorText = nil
        
        do {
            articles = try await network.fetchEverything(query: trimmed, language: "ru")
        } catch {
            errorText = error.localizedDescription
            articles = []
        }
        
        isLoading = false
    }
    
    
    func clear(){
        query = ""
        articles = []
        errorText = nil
    }
}

