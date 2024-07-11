//
//  Flickr_AppTests.swift
//  Flickr AppTests
//
//  Created by Tyler Edlin on 7/10/24.
//

import Testing
import XCTest
@testable import Flickr_App

final class Flickr_AppTests: XCTestCase {

    func testExample() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }
    
    func testImageViewModelInitialization() throws {
        let image = ImageModel(
            title: "Test Title",
            link: "https://example.com",
            media: ImageModel.Media(m: "https://example.com/image.jpg"),
            date_taken: "2024-01-01T00:00:00Z",
            description: "Test Description width=\"1024\" height=\"768\"",
            published: "2024-01-01T00:00:00Z",
            author: "Test Author"
        )
        
        let viewModel = ImageViewModel(image: image)
        
        XCTAssertEqual(viewModel.title, "Test Title")
        XCTAssertEqual(viewModel.description, "Test Description width=\"1024\" height=\"768\"")
        XCTAssertEqual(viewModel.author, "Test Author")
        XCTAssertEqual(viewModel.published, "Dec 31, 2023")
        XCTAssertEqual(viewModel.width, "1024")
        XCTAssertEqual(viewModel.height, "768")
    }

    func testFlickrAPISearch() throws {
        let flickrAPI = FlickrAPI()
        let expectation = self.expectation(description: "Fetch images from Flickr API")
        
        flickrAPI.searchImages(for: "nature") { result in
            switch result {
            case .success(let images):
                XCTAssertGreaterThan(images.count, 0)
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Error fetching images: \(error.localizedDescription)")
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
