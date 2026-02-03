

import SwiftUI

struct ArticleCell: View {
    let article: Article
    @EnvironmentObject private var favs: FavouritesService
    
    private var articleId : String {article.url ?? "" }
    private var isFav : Bool {
        _ = favs.version
        guard !articleId.isEmpty else { return false }
        return favs.isFavourite(id: articleId)
    }
    
    var body: some View {
        NavigationLink {
            DetailsView(article: article)
        } label: {
            HStack(alignment: .top, spacing: 12) {
                NewsImage(urlString: article.urlToImage)
                    .frame(width: 100, height: 70)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(article.title ?? "")
                        .font(type: .semiBold, size: 16)
                    
                    if let source = article.source?.name {
                        Text(source)
                            .font(type: .regular, size: 14)
                            .foregroundStyle(.secondary)
                    }
                }
                Spacer()
                Button {
                    favs.toggle(article: article)
                } label: {
                    Image(systemName: isFav ? "heart.fill" : "heart")
                }
                .buttonStyle(.plain)
                .disabled(articleId.isEmpty)
            }
        }
        .buttonStyle(.plain)
    }
}
