//
//  ShoppingCart.swift
//  DemoApp
//
//  Created by Tima Sikorski on 11/11/2023.
//

import Foundation

struct Product {
    var name: String
    var cost: Int
}

struct Coupon {
    var code: String
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
        let finalPrice = PriceCalculator.calculateFinalPrice(for: products, with: coupon)

        Router.shared.openCheckoutPage(forProducts: products, finalPrice: finalPrice)
    }
}
