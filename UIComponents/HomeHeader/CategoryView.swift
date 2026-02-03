

import SwiftUI

struct CategoryView: View {
    let selectedCategory: NewsCategory
    let onSelect: (NewsCategory) -> Void
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(NewsCategory.allCases, id: \.self) { category in
                    Button {
                       onSelect(category)
                    } label: {
                        Text(category.title)
                            .font(type: .semiBold)
                            .foregroundStyle(selectedCategory == category ? .black : .gray)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .background(selectedCategory == category ? Color.gray.opacity(0.2) : .clear)
                            .clipShape(Capsule())
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
        }
    }
}

