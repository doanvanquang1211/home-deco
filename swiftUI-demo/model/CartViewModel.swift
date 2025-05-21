//
//  CartViewModel.swift
//  swiftUI-demo
//
//  Created by Đoàn Văn Quang on 15/5/25.
//

struct Product: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let image: String
    let description: String
    let content: String
    let price: String
    let isFavourite: Bool
    var quantity: Int

}


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
    
    var total: Double {
        items.reduce(0 , { x, y in
            x + Double(y.quantity) * (Double(y.price) ?? 0)
        })
    }
    
    func formatCurrency(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        formatter.decimalSeparator = ","
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2

        return formatter.string(from: NSNumber(value: value)) ?? "0,00"
    }

}
