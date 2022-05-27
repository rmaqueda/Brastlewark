# Brastlewark

- List gnomes from network request
- Filter by gnome name 
- Filter by gnome hair color

- Gnome detail (not finished)  

## General information

- The project uses MVVM architecture with Combine
- The project uses SwiftUI
- CachedAsyncImage is a class to add cache to SwiftUI AsyncImage, more info: https://github.com/lorenzofiamingo/swiftui-cached-async-image

## Test targets

- BrastlewarkTests: Basic unit tests.
Tests using HTTPStubProtocol to provide STUB network responses globally, then check how the ViewModel behaves.

- BrastlewarkIntegrationTests: Real network request integration tests.

- BrastlewarkUITests: not complete but ready to develop UI tests with XCTest UI test.
