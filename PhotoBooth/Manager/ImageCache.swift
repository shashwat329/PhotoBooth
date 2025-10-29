//
//  ImageCache.swift
//  PhotoBooth
//
//  Created by shashwat singh on 28/10/25.
//


import SwiftUI

actor ImageCache {
    static let shared = ImageCache()
    private var cache = NSCache<NSURL, UIImage>()

    func get(forKey key: NSURL) -> UIImage? {
        cache.object(forKey: key)
    }

    func set(_ image: UIImage, forKey key: NSURL) {
        cache.setObject(image, forKey: key)
    }
}
