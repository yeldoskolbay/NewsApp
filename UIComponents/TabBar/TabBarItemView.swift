

import SwiftUI

struct TabBarItemView : View {
    let title: String
    let systemImage: String
    let isSelected: Bool
    let onTap: () -> Void
    var body: some View {
        Button {
            onTap()
        } label: {
            VStack(spacing: 6) {
                Image(systemName: systemImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                
                Text(title)
                    .font(type:.semiBold, size: 12)
            }
            .frame(maxWidth: .infinity)
            .foregroundStyle(isSelected ? .primary : .secondary)
        }
        .buttonStyle(.plain)
    }
}
