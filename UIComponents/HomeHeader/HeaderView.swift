

import SwiftUI

struct HeaderView: View {
    let title : String
    let category : NewsCategory
    var body: some View {
        HStack(spacing: 8) {
            Image(category.headerImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
            Text("\(title) News")
                .font(type: .bold, size: 22)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(.white)
    }
}

