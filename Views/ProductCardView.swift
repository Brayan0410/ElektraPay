//
//  ProductCardView.swift
//  ElektraPay
//
//  Created by Brayan Gutierrez Juarez on 15/05/25.
//

import SwiftUI

struct ProductCard: View {
    let product: Producto

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            AsyncImage(url: URL(string: product.urlImagenes.first ?? "")) { image in
                image.resizable()
                     .aspectRatio(contentMode: .fill)
                     .frame(height: 150)
                     .clipped()
            } placeholder: {
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 150)
            }

            Text(product.nombre)
                .font(.headline)

            Text("Precio: $\(Int(product.precioFinal))")
                .font(.subheadline)
                .foregroundColor(.green)

            Text("Categoría: \(product.codigoCategoria.rawValue)")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 4)
    }
}
