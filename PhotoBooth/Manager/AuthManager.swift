//
//  AuthManager.swift
//  PhotoBooth
//
//  Created by shashwat singh on 29/10/25.
//


import Foundation

final class AuthManager {
    static let shared = AuthManager()
    private init() {}

    private let service = "authService"
    private let account = "bearerToken"

    func saveToken(_ token: String) {
        if let data = token.data(using: .utf8) {
            KeychainHelper.shared.save(data, service: service, account: account)
        }
    }

    func getToken() -> String? {
        guard let data = KeychainHelper.shared.read(service: service, account: account),
              let token = String(data: data, encoding: .utf8) else {
            return nil
        }
        return token
    }

    func deleteToken() {
        KeychainHelper.shared.delete(service: service, account: account)
    }
}
