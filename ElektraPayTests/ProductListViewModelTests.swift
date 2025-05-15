//
//  ProductListViewModelTests.swift
//  ElektraPayTests
//
//  Created by Brayan Gutierrez Juarez on 15/05/25.
//

import XCTest
@testable import ElektraPay

final class ProductListViewModelTests: XCTestCase {
    var viewModel: ProductListViewModel!

    override func setUp() {
        super.setUp()
        viewModel = ProductListViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testLoadProducts() {
        viewModel.loadProducts()

        XCTAssertFalse(viewModel.productos.isEmpty, "La lista de productos no debe estar vacía después de cargar.")
    }

    func testSelectedProduct() {
        let producto = Producto.mock()

        viewModel.selectedProduct = producto

        XCTAssertEqual(viewModel.selectedProduct?.id, "123", "El producto seleccionado debería coincidir con el asignado.")
    }
}
extension Producto {
    static func mock() -> Producto {
        return Producto(
            id: "123",
            idLinea: 0,
            codigoCategoria: .c,
            idModalidad: 0,
            relevancia: 0,
            lineaCredito: "",
            pagoSemanalPrincipal: 0,
            plazoPrincipal: 0,
            disponibleCredito: true,
            abonosSemanales: [],
            sku: "SKU123",
            nombre: "TV LG",
            urlImagenes: ["https://example.com/tv.jpg"],
            precioRegular: 10000,
            precioFinal: 8999,
            porcentajeDescuento: 10,
            descuento: true,
            precioCredito: 0,
            montoDescuento: 1000
        )
    }
}


