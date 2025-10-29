//
//  ImageData.swift
//  PhotoBooth
//
//  Created by shashwat singh on 28/10/25.
//

import Foundation
struct ImageData: Codable,Identifiable {
    let id: String
    let slug: String
    let created_at: String
    let color: String
    let alt_description: String
    let urls : urls
}

struct urls : Codable{
    let raw: String
    let full: String
    let regular: String
    let thumb: String
    let small: String
}
