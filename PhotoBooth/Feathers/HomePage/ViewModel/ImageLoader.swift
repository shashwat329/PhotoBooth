//
//  ImageLoader.swift
//  PhotoBooth
//
//  Created by shashwat singh on 28/10/25.
//

import SwiftUI
import Combine

@MainActor
class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    @Published var isLoading = false
    @Published var error: Error?
    
    private let maxRetries = 3

    func load(from url: URL) async {
        // If cached, use immediately
        if let cached = await ImageCache.shared.get(forKey: url as NSURL) {
            image = cached
            return
        }

        isLoading = true
        error = nil

        var attempt = 0

        while attempt < maxRetries {
            do {
                let (data, response) = try await URLSession.shared.data(from: url)
                guard let httpResponse = response as? HTTPURLResponse,
                      (200..<300).contains(httpResponse.statusCode),
                      let downloadedImage = UIImage(data: data) else {
                    throw URLError(.badServerResponse)
                }

                await ImageCache.shared.set(downloadedImage, forKey: url as NSURL)
                image = downloadedImage
                isLoading = false
                return

            } catch {
                attempt += 1
                if attempt >= maxRetries {
                    self.error = error
                    isLoading = false
                } else {
                    try? await Task.sleep(nanoseconds: 1_000_000_000) // wait 1s before retry
                }
            }
        }
    }
}
