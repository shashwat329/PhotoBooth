//
//  AsyncImageView.swift
//  PhotoBooth
//
//  Created by shashwat singh on 28/10/25.
//
import SwiftUI

struct AsyncImageView: View {
    @StateObject private var loader = ImageLoader()
    let url: URL
    
    var placeholder: AnyView = AnyView(
        ProgressView()
            .scaleEffect(1.5)
            .tint(.blue)
    )
    
    var errorImage: AnyView = AnyView(
        VStack(spacing: 8) {
            Image(systemName: "photo.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.gray.opacity(0.6))
            Text("Failed to load")
                .foregroundColor(.secondary)
                .font(.caption)
        }
    )
    
    var body: some View {
        ZStack {
            if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .frame(height: 500)
                    .transition(.opacity.combined(with: .scale))
                    .animation(.easeInOut(duration: 0.3), value: loader.image)
            } else if loader.isLoading {
                placeholder
            } else if loader.error != nil {
                VStack {
                    errorImage
                    Button("Retry") {
                        Task {
                            await loader.load(from: url)
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.top, 8)
                }
            } else {
                placeholder
            }
        }
        .task {
            await loader.load(from: url)
        }
    }
}
