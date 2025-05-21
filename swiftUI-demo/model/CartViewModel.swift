//
//  CartViewModel.swift
//  swiftUI-demo
//
//  Created by Đoàn Văn Quang on 15/5/25.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var items: [Product] = []

    func addToCart(product: Product) {
        if let index = items.firstIndex(where: { $0.id == product.id }) {
            items[index].quantity += 1
        } else {
            var newProduct = product
            newProduct.quantity = 1
            items.append(newProduct)
        }
    }

    func decreaseQuantity(of product: Product) {
        guard let index = items.firstIndex(where: { $0.id == product.id })
        else { return }

        if items[index].quantity > 1 {
            items[index].quantity -= 1
        } else {
            items.remove(at: index)
        }
    }

    func removeItem(_ product: Product) {
        items.removeAll { $0.id == product.id }
    }
}
