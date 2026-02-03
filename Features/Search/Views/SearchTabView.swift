

import SwiftUI

struct SearchTabView: View {
    @StateObject private var viewModel = SearchViewModel()
    @State private var selectedArticle: Article?
    @FocusState private var isFocused: Bool
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                
                // Search Bar
                HStack(spacing: 10) {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.secondary)
                    
                    TextField("Поиск новостей...", text: $viewModel.query)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .submitLabel(.search)
                        .focused($isFocused)
                        .onSubmit {
                            Task { await viewModel.search() }
                        }
                    
                    if !viewModel.query.isEmpty {
                        Button {
                            viewModel.clear()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundStyle(.secondary)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .padding(.horizontal, 16)
            .padding(.top, 8)
            
            // Content
            if viewModel.isLoading {
                ProgressView()
                    .padding(.top, 20)
                Spacer()
            } else if let error = viewModel.errorText {
                VStack(spacing: 10) {
                    Text(error)
                        .foregroundStyle(.red)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 16)
                    
                    Button {
                        Task { await viewModel.search() }
                    } label: {
                        Text("Повторить")
                    }
                }
                .padding(.top, 20)
                
                
                Spacer()
            } else if viewModel.articles.isEmpty {
                VStack(spacing: 10) {
                    Text("Введите запрос и нажмите Поиск")
                        .foregroundStyle(.secondary)
                }
                .padding(.top, 20)
                
                Spacer()
            } else {
                ArticlesListView(articles: viewModel.articles, onSelect: { article in selectedArticle = article })
            }
        }
        .navigationDestination(item: $selectedArticle, destination: { article in
            DetailsView(article: article)
        })
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {isFocused = true}
        .navigationDestination(item: $selectedArticle) { article in
            DetailsView(article: article)
        }
    }
}


