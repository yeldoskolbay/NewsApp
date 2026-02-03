

import SwiftUI

struct TabBarView: View {
    @State private var selected : AppTab = .home
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selected) {
                NavigationStack { HomeView() }
                    .tag(AppTab.home)
                
                NavigationStack { FavouritesView() }
                    .tag(AppTab.favorites)
                
                NavigationStack { SearchTabView() }
                    .tag(AppTab.search)
            }
            .toolbar(.hidden, for: .tabBar)
            
            CustomTabBar(selected: $selected)
        }
        .ignoresSafeArea(.keyboard)
        .zIndex(1)
    }
}



