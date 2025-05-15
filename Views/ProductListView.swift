//
//  ProductListView.swift
//  ElektraPay
//
//  Created by Brayan Gutierrez Juarez on 15/05/25.
//

import SwiftUI

struct ProductListView: View {
    @ObservedObject var viewModel: ProductListViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        List(viewModel.productos, id: \.id) { product in
            ProductCard(product: product)
                .onTapGesture {
                    viewModel.selectedProduct = product
                    presentationMode.wrappedValue.dismiss()
                }
        }
        .navigationTitle("Selecciona un producto")
    }
}
#Preview {
    ContentView()
}
