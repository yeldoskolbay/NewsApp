
import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    @StateObject private var viewModel = NewsViewModel()
    @State private var selectedArticle: Article?
    var body: some View {
        NavigationStack {
            VStack(){
                //MARK: Header
                VStack{
                    HeaderView(title: viewModel.selectedCategory.title, category: viewModel.selectedCategory)
                    //MARK: Categories
                        CategoryView(selectedCategory: viewModel.selectedCategory) { category in
                            viewModel.selectedCategory = category
                            Task { await viewModel.loadTop()}
                        }
                        Divider()
                        
                        //MARK: News List
                    ArticlesListView(articles: viewModel.articles) { article in
                        selectedArticle = article
                    }
                }
                .padding(.horizontal, 20)
                .background(.white)
                .zIndex(1)
            }
            .task {
                await viewModel.loadTop()
            }
            .navigationDestination(item: $selectedArticle) { article in
                DetailsView(article: article)
            }
        }
    }
}



#Preview {
    TabBarView()
}



