//
//  RecipeModel.swift
//  testConnection
//
//  Created by Mohamed Ali on 19/01/2024.
//

import Foundation

struct RecipeResponse: Codable {
    let hits: [Hit]
}

struct Hit: Codable {
    let recipe: RecipeModel
}

struct RecipeModel: Codable {
    let label: String
    let images: Images
    let source: String
    let yield: Double
}

struct Images: Codable {
    let thumbnail, small, regular: Large
    let large: Large?
    
    enum CodingKeys: String, CodingKey {
        case thumbnail = "THUMBNAIL"
        case small = "SMALL"
        case regular = "REGULAR"
        case large = "LARGE"
    }
}

// MARK: - Large
struct Large: Codable {
    let url: String
    let width, height: Int
}
