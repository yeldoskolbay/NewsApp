

import SwiftUI

struct FavouriteDetailsView: View {
    let item: FavouriteArticle

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                
                Text(item.title ?? "")
                    .font(type: .bold, size: 20)
                    .frame(maxWidth: .infinity, alignment: .leading)

                NewsImage(urlString: item.imageUrl ?? "")
                    .frame(height: 240)
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                Text(item.desc ?? "")
                    .font(type: .regular, size: 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
            .padding(.top, 15)
        }
        .navigationBarTitleDisplayMode(.inline)
        .tint(Color.black)
    }
}
