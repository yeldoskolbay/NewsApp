
import SwiftUI

struct FavouritesView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \FavouriteArticle.createdAt, ascending: false)]
    ) private var items: FetchedResults<FavouriteArticle>

    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        FavouriteDetailsView(item: item)
                    } label: {
                        HStack(spacing: 12) {
                            NewsImage(urlString: item.imageUrl ?? "")
                                .frame(width: 100, height: 70)
                                .clipShape(RoundedRectangle(cornerRadius: 8))

                            Text(item.title ?? "")
                                .lineLimit(3)
                        }
                    }
                }
            }
            .navigationTitle("Избранное")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}


