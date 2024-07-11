//
//  NetworkService.swift
//  Flickr App
//
//  Created by Tyler Edlin on 7/10/24.
//

import SwiftUI

class NetworkService {
    static let shared = NetworkService()
    
    func fetchData(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Data was nil."])
                completion(.failure(error))
                return
            }
            
            completion(.success(data))
        }
        task.resume()
    }
}
