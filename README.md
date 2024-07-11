# Flickr Image Search App

## Overview

The Flickr Image Search App is designed to fetch and display images from Flickr based on user input. The app allows users to search for images using a search bar, view results in a grid format, and access detailed information about each image. This project leverages SwiftUI, Combine, and the MVVM architectural pattern to create a responsive and maintainable application.

## Goal
- Fetch and display images from Flickr based on user input.
- Show a grid of images matching the search terms entered by the user.
- Update search results dynamically with each keystroke.
- Display a progress indicator while fetching images without blocking the UI.
- Provide a detailed view for each image, including the image itself, title, description, author, and published date.
- Implement unit and UI tests to ensure app functionality and reliability.

## Tools, Packages, and APIs Used

- **SwiftUI**: For building the user interface.
- **Combine**: For handling asynchronous events and state management.
- **Swift Concurrency**: For managing asynchronous tasks.
- **MVVM Pattern**: For organizing the codebase.
- **Flickr API**: For fetching images based on user input.

## Features

- **Search Bar**: Users can enter search terms to find images on Flickr.
- **Grid View**: Displays a scrollable grid of thumbnail images matching the search terms.
- **Detail View**: Shows detailed information about the selected image, including the image, title, description, author, and published date.
- **Real-time Search**: Updates the search results dynamically with each keystroke.
- **Progress Indicator**: Displays a progress view while fetching images.
- **Accessibility Support**: Supports VoiceOver and dynamic text.
- **Unit Tests**: Includes tests to cover key portions of the code.
- **UI Tests**: Ensures the app's UI behaves as expected.
- **Extra**: Supports dark and light mode

- ## Setup and Usage

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/FlickrImageSearchApp.git
   cd FlickrImageSearchApp

## Images

- **SearchView**: Users can enter search terms to find scroll through images on Flickr.
  
<img src="https://github.com/michael-edlin/Flickr-App/assets/80922342/13e9612b-7288-42c5-9aac-67a77a413fce" width="300" height="600" />

- **Detail View**: Shows detailed information about the selected image, including the image, title, description, author, and published date.
  
<img src="https://github.com/michael-edlin/Flickr-App/assets/80922342/cca729fc-ed29-4898-999f-5646f56c32f6" width="300" height="600" />


- **Detail View**: Shows support for landscape view

  <img src="https://github.com/michael-edlin/Flickr-App/assets/80922342/2055d112-2572-48ff-95bd-54870312b83b" width="600" height="300" />
```

