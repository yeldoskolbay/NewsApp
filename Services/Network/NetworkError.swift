

import Foundation


enum NetworkError: LocalizedError {
    case badURL
    case invalidResponse
    case httpStatus(Int)
    case decoding(Error)
    
    var errorDescription: String? {
        switch self {
        case .badURL:
            return "Bad URL"
        case .invalidResponse:
            return "Invalid Response"
        case .httpStatus(let code):
            return "HTTP error: \(code)"
        case .decoding(let error):
            return "Decoding error: \(error.localizedDescription)"
        }
    }
}
