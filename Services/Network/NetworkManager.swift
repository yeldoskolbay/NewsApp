
import Foundation

final class NetworkManager {
    private let apiKey = API.newsApiKey
    private let session: URLSession
    private let baseURL = URL(string: "https://newsapi.org/v2")!
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    //MARK: Helpers
    func makeURL(path: String, queryItems: [URLQueryItem]) throws -> URL {
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)
        components?.path = baseURL.path + path
        
        var items = queryItems
        items.append(URLQueryItem(name: "apiKey", value: apiKey))
        components?.queryItems = items
        
        guard let url = components?.url else { throw NetworkError.badURL }
        return url
    }
    
    private func request<T: Decodable>(url: URL) async throws -> T {
        let (data, response) = try await session.data(from: url)
        
        guard let http = response as? HTTPURLResponse else{
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(http.statusCode) else {
            throw NetworkError.httpStatus(http.statusCode)
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decoding(error)
        }
    }
    
    //MARK: - Search / Everything
    func fetchEverything(query: String, language: String = "ru") async throws -> [Article] {
        let q = query.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !q.isEmpty else { return [] }
        
        let url = try makeURL(path: "/everything", queryItems: [
            URLQueryItem(name: "q", value: q),
            URLQueryItem(name: "language", value: language),
            URLQueryItem(name: "sortBy", value: "publishedAt"),
            
            ])
        let response: NewsResponse = try await request(url: url)
        return response.articles
    }
}

