//
//  ViewModel.swift
//  ElektraPay
//
//  Created by Brayan Gutierrez Juarez on 15/05/25.
//

import Foundation

class ProductListViewModel: ObservableObject {
    @Published var productos: [Producto] = []
    @Published var selectedProduct: Producto?
    @Published var isLoading = false
    @Published var errorMessage: String?

    func loadProducts() {
        isLoading = true
        ProductService.shared.fetchProducts { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let productos):
                    self.productos = productos
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
