

import SwiftUI

struct CustomTabBar: View {
    @Binding var selected : AppTab
    var body: some View {
        HStack {
            ForEach(AppTab.allCases, id: \.self) { tab in
                TabBarItemView(title: tab.rawValue, systemImage: tab.systemImageName, isSelected: selected == tab) {
                    withAnimation(.spring(response: 0.25, dampingFraction: 0.9)) {
                        selected = tab
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 10)
        .padding(.bottom, 10)
        .background(.ultraThinMaterial)
        .overlay(Divider(), alignment: .top)
    }
}
