

import SwiftUI

@main
struct NewsAppApp: App {
    let persistenceController = PersistenceController.shared
    

    var body: some Scene {
        WindowGroup {
            let context = persistenceController.container.viewContext
            TabBarView()
                .environment(\.managedObjectContext, context)
                .environmentObject(FavouritesService(context: context))
        }
    }
}
