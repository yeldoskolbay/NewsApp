
# NewsApp

Pet-project на SwiftUI с архитектурой MVVM.
Приложение для просмотра новостей, поиска и сохранения статей в избранное.


---


## Features

- Просмотр новостей
- Поиск новостей по ключевым словам
- Избранное (Core Data)
- Детальный экран новости
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

## API Key

Приложение использует **NewsAPI**
https://newsapi.org

Для запуска проекта необходимо добавить API ключ.

### Шаги:

1. Зарегестрируйтесь на https://newsapi.org
2. Получите ваш **API Key**
3. В проекте создайте файл `API.swift`
4. Добавьте в него следующий код:


```swift
enum API {
    static let newsApiKey = "YOUR_API_KEY"
}
