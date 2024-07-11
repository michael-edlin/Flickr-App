//
//  SearchView.swift
//  Flickr App
//
//  Created by Tyler Edlin on 7/10/24.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    
    var body: some View {
        VStack {
            ProfileRow()
                .padding()
            SearchBar(text: $viewModel.searchText)
            if viewModel.isLoading {
                ProgressView()
                    .padding()
            }
            ScrollView {
                VStack(spacing: 60) {
                    items
                }
                .padding(30)
            }
        }
    }
    
    var items: some View {
        ForEach(viewModel.images) { imageViewModel in
            NavigationLink(destination: DetailView(viewModel: imageViewModel)) {
                AsyncImage(url: imageViewModel.imageUrl) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                    case .failure:
                        Image(systemName: "photo")
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 300)
            }
            .background(Color.primary)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.linearGradient(colors: [.primary.opacity(0.3), .primary.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
            )
            .cornerRadius(20)
            .shadow(color: .primary.opacity(0.3), radius: 20)
        }
        .scrollTransition { content, phase in
            content
                .rotation3DEffect(.degrees(phase.isIdentity ? 0 : 60), axis: (x: -1, y: 1, z: 0), perspective: 0.5)
                .rotationEffect(.degrees(phase.isIdentity ? 0 : -30))
                .offset(x: phase.isIdentity ? 0 : -200)
                .blur(radius: phase.isIdentity ? 0 : 10)
                .scaleEffect(phase.isIdentity ? 1 : 0.8)
        }
        .padding()
        .navigationTitle("Flickr Image Search")
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search images...", text: $text)
                .padding(7)
                .background(Color(.systemGray6))
                .cornerRadius(8)
        }
        .padding()
    }
}

#Preview {
    SearchView()
}
