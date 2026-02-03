
import CoreData

@MainActor
final class FavouritesService: ObservableObject {
    private let context: NSManagedObjectContext
    
    // Для обновления UI
    @Published private(set) var version = 0
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func isFavourite(id: String) -> Bool {
        let request = FavouriteArticle.fetchRequest()
        request.fetchLimit = 1
        request.predicate = NSPredicate(format: "id == %@", id)
        return (try? context.count(for: request)) ?? 0 > 0
    }
    
    func add(from article: Article) {
        let fav = FavouriteArticle(context: context)
        fav.id = article.url
        fav.title = article.title
        fav.desc = article.description
        fav.imageUrl = article.urlToImage
        fav.url = article.url
        fav.sourceName = article.source?.name
        fav.createdAt = Date()
        
        save()
    }
    
    func remove(id: String) {
        let request = FavouriteArticle.fetchRequest()
        request.fetchLimit = 1
        request.predicate = NSPredicate(format: "id == %@", id)
        
        if let obj = try? context.fetch(request).first {
            context.delete(obj)
            save()
        }
    }
    
    func toggle(article: Article) {
        let id = article.url ?? ""
        guard !id.isEmpty else { return }
        
        if isFavourite(id: id) {
            remove(id: id)
        } else {
            add(from: article)
        }
        
        version += 1 // Обновляем View
    }
    
    private func save() {
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch {
            print("CoreData save error: \(error)")
        }
    }
}
