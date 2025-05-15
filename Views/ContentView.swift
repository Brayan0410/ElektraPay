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
                Text("Elektra")
                    .font(.system(size: 80, weight: .bold))
                    .foregroundColor(.red)

                if let product = viewModel.selectedProduct {
                    ProductCard(product: product)
                } else {
                    Text("Compra facil y rapido en la app de Elektra")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                }

                Button("Ver productos") {
                    viewModel.loadProducts()
                    showProductList = true
                }
                .font(.title2) // Texto más grande
                .padding(.vertical, 16)
                .padding(.horizontal, 40)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(12)

                NavigationLink(destination: ProductListView(viewModel: viewModel),
                               isActive: $showProductList) {
                    EmptyView()
                }
            }
            .padding(.bottom, 500)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
