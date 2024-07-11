//
//  ImageViewModel.swift
//  Flickr App
//
//  Created by Tyler Edlin on 7/10/24.
//

import SwiftUI

class ImageViewModel: ObservableObject, Identifiable {
    private let image: ImageModel
    
    var id: UUID {
        return image.id
    }
    
    var title: String {
        return image.title
    }
    
    var description: String {
        return image.description
    }
    
    var author: String {
        return image.author
    }
    
    var published: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = formatter.date(from: image.published) {
            formatter.dateStyle = .medium
            formatter.timeStyle = .none
            return formatter.string(from: date)
        }
        return image.published
    }
    
    var width: String {
        return extractDimension(from: image.description, dimension: "width")
    }
    
    var height: String {
        return extractDimension(from: image.description, dimension: "height")
    }
    
    var imageUrl: URL? {
        return URL(string: image.media.m)
    }
    
    init(image: ImageModel) {
        self.image = image
    }
    
    private func extractDimension(from description: String, dimension: String) -> String {
        let pattern = "\(dimension)=\"(\\d+)\""
        if let regex = try? NSRegularExpression(pattern: pattern, options: []),
           let match = regex.firstMatch(in: description, options: [], range: NSRange(location: 0, length: description.count)) {
            if let range = Range(match.range(at: 1), in: description) {
                return String(description[range])
            }
        }
        return "Unknown"
    }
}
