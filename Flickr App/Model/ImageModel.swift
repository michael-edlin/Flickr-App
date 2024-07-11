//
//  ImageModel.swift
//  Flickr App
//
//  Created by Tyler Edlin on 7/10/24.
//

import SwiftUI

struct ImageModel: Identifiable, Decodable {
    let id = UUID()
    let title: String
    let link: String
    let media: Media
    let date_taken: String
    let description: String
    let published: String
    let author: String
    
    struct Media: Decodable {
        let m: String
    }
}
