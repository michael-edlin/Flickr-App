//
//  DetailView.swift
//  Flickr App
//
//  Created by Tyler Edlin on 7/10/24.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: ImageViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                if let url = viewModel.imageUrl {
                    imageLoader(url: url)
                }
            }
            .padding()
        }
        .navigationTitle("Image Detail")
    }
    
    @ViewBuilder
    private func imageLoader(url: URL) -> some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                CardView(
                    title: viewModel.title,
                    image: image,
                    description: viewModel.description,
                    author: viewModel.author,
                    published: viewModel.published,
                    width: viewModel.width,
                    height: viewModel.height
                )
            case .failure:
                Image(systemName: "photo")
            @unknown default:
                EmptyView()
            }
        }
        .frame(height: 300)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: ImageViewModel(image: ImageModel(
            title: "Sample Title",
            link: "https://example.com",
            media: ImageModel.Media(m: "https://example.com/image.jpg"),
            date_taken: "2024-01-01T00:00:00Z",
            description: "Sample Description",
            published: "2024-01-01T00:00:00Z",
            author: "Sample Author"
        )))
    }
}
