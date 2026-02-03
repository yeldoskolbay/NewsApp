

import SwiftUI
struct ArticlesListView : View {
    let articles: [Article]
    let onSelect : (Article) -> Void
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 12) {
                ForEach(articles) { article in
                    Button {
                        onSelect(article)
                    } label: {
                        ArticleCell(article: article)
                    }
                    .buttonStyle(.plain)
                    Divider()
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 8)
        }
    }

}
