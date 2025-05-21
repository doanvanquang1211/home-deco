//
//  APIService.swift
//  Home Decor
//
//  Created by Đoàn Văn Quang on 21/5/25.
//

import Foundation

class APIService {
    static let shared = APIService()

    private init() {}

    func request<T: Decodable>(
        url: String,
        method: String = "GET",
        headers: [String: String]? = nil,
        body: Data? = nil,
        responseType: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let url = URL(string: url) else {
            completion(.failure(APIError.invalidURL))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = method

        if let headers = headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }

        request.httpBody = body

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(APIError.noData))
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

enum APIError: Error {
    case invalidURL
    case noData
}
