

import Foundation


enum NewsCategory: String, CaseIterable, Identifiable {
    case general, business, entertainment, health, science, sports, technology
    var id: String { rawValue }
    
    var title: String { rawValue.capitalized }
    
    var query: String{
        switch self {
        case.general: return "События сегодня"
        case.business: return "Бизнес"
        case.entertainment: return "Развлечения"
        case.health: return "Здоровье"
        case.science: return "Наука"
        case.sports: return "Спорт"
        case.technology: return "Технологии"
        }
    }
    
    var headerImageName: String {
        switch self {
        case .general: return "general"
        case .business: return "business"
        case .entertainment: return "entertainment"
        case .health: return "health"
        case .science: return "science"
        case .sports: return "sports"
        case .technology: return "technology"
        }
    }
}
