//
//  CallView.swift
//  ElektraPay
//
//  Created by Brayan Gutierrez Juarez on 15/05/25.
//

import SwiftUI

struct CallView: View {
    @State private var selectedProduct: Producto?
    @State private var showProductList = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                if let product = selectedProduct {
                    Text("Producto Seleccionado:")
                    Text(product.nombre)
                        .font(.headline)
                    Text("$\(product.precioFinal, specifier: "%.2f")")
                } else {
                    Text("No has seleccionado un producto.")
                }

                Button("Ver Productos") {
                    showProductList = true
                }
                .sheet(isPresented: $showProductList) {
                    ProductListView(selectedProduct: $selectedProduct)
                }
            }
            .padding()
            .navigationTitle("Inicio")
        }
    }
}

#Preview {
    CallView()
}
