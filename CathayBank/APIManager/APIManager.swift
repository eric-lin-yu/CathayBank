//
//  APIManager.swift
//  CathayBank
//
//  Created by wistronits on 2023/8/18.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}

enum APIResult {
    case success(data: Data)
    case failure(error: Error)
}

class APIManager {
    static let shared = APIManager()

    private init() {}

    func request(endpoint: String, method: HttpMethod, completion: @escaping (APIResult) -> Void) {
        guard let url = URL(string: endpoint) else {
            completion(.failure(error: NSError(domain: "APIManager", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                completion(.success(data: data))
            } else if let error = error {
                completion(.failure(error: error))
            } else {
                completion(.failure(error: NSError(domain: "APIManager", code: 0, userInfo: nil)))
            }
        }.resume()
    }
}

