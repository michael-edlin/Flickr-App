//
//  FlickrAPI.swift
//  Flickr App
//
//  Created by Tyler Edlin on 7/10/24.
//

import SwiftUI
import Foundation

class FlickrAPI {
    private let baseURL = "https://api.flickr.com/services/feeds/photos_public.gne"
    
    func searchImages(for tags: String, completion: @escaping (Result<[ImageModel], Error>) -> Void) {
        let urlString = "\(baseURL)?format=json&nojsoncallback=1&tags=\(tags)"
        guard let url = URL(string: urlString) else {
            let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL."])
            completion(.failure(error))
            return
        }
        
        NetworkService.shared.fetchData(url: url) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(FlickrResponse.self, from: data)
                    completion(.success(response.items))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

struct FlickrResponse: Decodable {
    let items: [ImageModel]
}
