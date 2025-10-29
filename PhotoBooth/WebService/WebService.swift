//
//  WebService.swift
//  PhotoBooth
//
//  Created by shashwat singh on 28/10/25.
//

import Foundation
enum NetworkError: Error {
    case badURL
    case badResponse
    case decodingError
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .badURL:
            return "Invalid URL. Please contact support."
        case .badResponse:
            return "Server returned an invalid response."
        case .decodingError:
            return "Failed to decode the server response."
        }
    }
}
class WebService {
    func getData() async throws -> [ImageData]{
        guard let baseURLString = Bundle.main.object(forInfoDictionaryKey: "BaseURL") as? String else {
            throw NetworkError.badURL
        }
        let url = URL(string: "\(baseURLString)?client_id=\(accessKey)")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        return try JSONDecoder().decode([ImageData].self, from: data)
    }
}
