//
//  HomeViewModel.swift
//  PhotoBooth
//
//  Created by shashwat singh on 28/10/25.
//

import Foundation
import Combine

@MainActor
class HomeViewModel: ObservableObject {
    @Published var imageData: [ImageData] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let webservice = WebService()

    func loadData() async {
        isLoading = true
        errorMessage = nil
        do {
            // Fetch raw response
            let response = try await webservice.getData()
            self.imageData = response
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
