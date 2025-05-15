//
//  APIService.swift
//  ElektraPay
//
//  Created by Brayan Gutierrez Juarez on 15/05/25.
//

import Foundation

class ProductService {
    static let shared = ProductService()
    private let urlString = "http://alb-dev-ekt-875108740.us-east-1.elb.amazonaws.com/apps/moviles/caso-practico/plp"

    func fetchProducts(completion: @escaping (Result<[Producto], Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(URLError(.badURL)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }

            do {
                let response = try JSONDecoder().decode(ElektraPay.self, from: data)
                completion(.success(response.resultado.productos))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

