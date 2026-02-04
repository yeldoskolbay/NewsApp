
# NewsApp

Pet-project на **SwiftUI**, демонстрирующий работу с сетью, архитектурой **MVVM**, навигацией и хранением данных.


---


## Features

- Просмотр новостей
- Поиск новостей по ключевым словам
- Детальный экран статьи
- Избранное (Core Data)
- NavigationStack + TabBar
- Асинхронная загрузка данных (async / await)
- Загрузка изображений (SDWebImage)

---

## Architecture

Проект построен по принципам **MVVM** с feature-based структурой.

- **View**- SwiftUI экраны и UI-компоненты
- **ViewModel** - состояние экранов и бизнес-логика
- **Services** - NetworkManager, Core Data
- **Models** - DTO и Core Data entities

---
## Project Structure
NewsApp
├─ App
│  └─ NewsAppApp.swift
│
├─ Features
│  ├─ Home
│  │  ├─ ViewModel
│  │  │  └─ NewsViewModel.swift
│  │  └─ Views
│  │     ├─ HomeView.swift
│  │     └─ DetailsView.swift
│  │
│  ├─ Search
│  │  ├─ ViewModel
│  │  │  └─ SearchViewModel.swift
│  │  └─ Views
│  │     └─ SearchTabView.swift
│  │
│  └─ Favourites
│     └─ Views
│        ├─ FavouritesView.swift
│        └─ FavouriteDetailsView.swift
│
├─ Services
│  ├─ Network
│  │  ├─ Constants.swift
│  │  ├─ NetworkManager.swift
│  │  └─ NetworkError.swift
│  │
│  └─ Persistence
│     ├─ PersistenceController.swift
│     └─ FavouritesService.swift
│
├─ UIComponents
│  ├─ Article
│  │  ├─ ArticleCell.swift
│  │  └─ ArticlesListView.swift
│  │
│  ├─ HomeHeader
│  │  ├─ HeaderView.swift
│  │  └─ CategoryView.swift
│  │
│  └─ TabBar
│     ├─ CustomTabBar.swift
│     ├─ TabBarItemView.swift
│     └─ TabView.swift
│
├─ NewsApp
│  ├─ Extension
│  │  └─ Modifier
│  │     └─ Font
│  │        ├─ Font.swift
│  │        └─ ViewExt.swift
│  │
│  ├─ Model
│  │  ├─ DTO
│  │  │  └─ NewsResponse.swift
│  │  └─ Enums
│  │     ├─ AppTab
│  │     │  └─ AppTab.swift
│  │     └─ NewsCategory
│  │        └─ NewsCategory.swift
│  │
│  ├─ Info.plist
│  └─ NewsAppModel.xcdatamodeld
│     └─ NewsAppModel.xcdatamodel
│
├─ Resources
│  ├─ Assets.xcassets
│  └─ Fonts
│     ├─ FontManager.swift
│     └─ Lora.ttf
│
├─ NewsApp.xcodeproj
└─ README.md


---

## API Key

Приложение использует **NewsAPI**
https://newsapi.org

Для запуска проекта необходимо добавить API ключ.

### Шаги:

1. Зарегестрируйтесь на https://newsapi.org
2. Получите ваш **API Key**
3. В проекте создайте файл `API.swift` (он добавлен в .gitignore)
4. Добавьте в него следующий код:


```swift
enum API {
    static let newsApiKey = "YOUR_API_KEY"
}


## Tech Stack
-SwiftUI
-MVVM
-async/await
-URLSession
-Core Data
-SDWebImage
-Git/GitHub


## Notes

-Проект написан как pet-project
-Основной фокус - архитектура, чистота кода и читаемость
-API ключ не хранится в репозитории


