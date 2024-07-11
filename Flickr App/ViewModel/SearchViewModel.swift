//
//  SearchViewModel.swift
//  Flickr App
//
//  Created by Tyler Edlin on 7/10/24.
//

import SwiftUI
import Combine

class SearchViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var images: [ImageViewModel] = []
    @Published var isLoading = false
    
    private var cancellables = Set<AnyCancellable>()
    private let flickrAPI = FlickrAPI()
    
    init() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] searchText in
                self?.searchImages(for: searchText)
            }
            .store(in: &cancellables)
    }
    
    func searchImages(for tags: String) {
        guard !tags.isEmpty else {
            self.images = []
            return
        }
        self.isLoading = true
        flickrAPI.searchImages(for: tags) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let images):
                    self?.images = images.map { ImageViewModel(image: $0) }
                case .failure(let error):
                    print("Error fetching images: \(error.localizedDescription)")
                }
            }
        }
    }
}
