//
//  ShoppingCart.swift
//  DemoApp
//
//  Created by Tima Sikorski on 11/11/2023.
//

import Foundation

struct Product {
    var cost: Int
}

struct Coupon {
    var discountPercentage: Double
}

class ShoppingCart {
    static let shared = ShoppingCart()

    private var products = [Product]()
    private var coupon: Coupon?

    func add(_ product: Product) {
        products.append(product)
    }

    func apply(_ coupon: Coupon) {
        self.coupon = coupon
    }

    func startCheckout() {
        var finalPrice = products.reduce(0) { price, product in
            return price + product.cost
        }

        if let coupon = coupon {
            let multiplier = coupon.discountPercentage / 100
            let discount = Double(finalPrice) * multiplier
            finalPrice -= Int(discount)
        }

        Router.shared.openCheckoutPage(forProducts: products,
                                       finalPrice: finalPrice)
    }
}
