//
//  ContentView.swift
//  ElektraPay
//
//  Created by Brayan Gutierrez Juarez on 15/05/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ProductListViewModel()
    @State private var showProductList = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                if let product = viewModel.selectedProduct {
                    ProductCard(product: product)
                } else {
                    Text("Selecciona un producto")
                        .foregroundColor(.gray)
                }

                Button("Ver productos") {
                    viewModel.loadProducts()
                    showProductList = true
                }
                .buttonStyle(.borderedProminent)

                NavigationLink(destination: ProductListView(viewModel: viewModel),
                               isActive: $showProductList) {
                    EmptyView()
                }
            }
            .padding()
            .navigationTitle("Elektra")
        }
    }
}

#Preview {
    ContentView()
}
