

import Foundation

struct NewsResponse: Decodable {
    let status: String
    let totalResults: Int?
    let articles: [Article]
}


struct Article: Decodable, Identifiable, Hashable {
    var id : String { url ?? UUID().uuidString }
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let source: Source?
    
    private enum CodingKeys: String, CodingKey {
        case author
        case title
        case description
        case url
        case urlToImage
        case publishedAt
        case source
    }
}

struct Source: Decodable, Hashable {
    let id: String?
    let name: String?
}
