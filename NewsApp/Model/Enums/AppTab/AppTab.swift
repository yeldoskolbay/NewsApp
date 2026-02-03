

import Foundation


enum AppTab : String, CaseIterable, Hashable {
    case home = "Главная"
    case favorites = "Избранное"
    case search = "Поиск"
    
    var systemImageName: String {
        switch self {
        case .home:
            return "house"
        case .favorites:
            return "heart"
        case .search:
            return "magnifyingglass"
        }
    }
}
