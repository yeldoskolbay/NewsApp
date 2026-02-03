
import SwiftUI
import SDWebImageSwiftUI

struct DetailsView : View {
    let article: Article
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var favs: FavouritesService
    
    private var articleId: String {article.url ?? ""}
    private var isFav: Bool {
        guard !articleId.isEmpty else { return false }
        return favs.isFavourite(id: articleId)
    }
    
    
    var body: some View {
        ScrollView {
           VStack(alignment: .leading, spacing: 12) {
               Text(article.title ?? "")
                   .font(type: .bold , size: 22)
               NewsImage(urlString: article.urlToImage ?? "")
                   .frame(maxWidth: .infinity, maxHeight: 250)
                   .clipShape(RoundedRectangle(cornerRadius: 12))
               Text(article.description ?? "")
                   .font(type: .semiBold, size: 16)
                   .lineLimit(nil)
               Text(article.author ?? "")
                   .font(type: .regular, size: 14)
                   .foregroundStyle(.secondary)
            }
           .padding(.horizontal, 20)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.black)
                        Text("Назад")
                            .font(type: .semiBold, size: 16)
                            .foregroundStyle(.black)
                    }
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    favs.toggle(article: article)
                } label: {
                    Image(systemName: isFav ? "heart.fill" : "heart")
                        .foregroundStyle(.black)
                }
                .disabled(articleId.isEmpty)
            }
        }
    }
}


