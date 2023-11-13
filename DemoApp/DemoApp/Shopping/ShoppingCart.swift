//
//  ShoppingCart.swift
//  DemoApp
//
//  Created by Tima Sikorski on 11/11/2023.
//

import Foundation

struct Product: Equatable {
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
    private var checkoutPageOpener: CheckoutPageOpener

    init(checkoutPageOpener: CheckoutPageOpener = Router.shared) {
        self.checkoutPageOpener = checkoutPageOpener
    }

    func add(_ product: Product) {
        products.append(product)
    }

    func apply(_ coupon: Coupon) {
        self.coupon = coupon
    }

    func startCheckout() {
        let finalPrice = PriceCalculator.calculateFinalPrice(for: products, with: coupon)
        checkoutPageOpener.openCheckoutPage(for: products, finalPrice: finalPrice)
    }
}
