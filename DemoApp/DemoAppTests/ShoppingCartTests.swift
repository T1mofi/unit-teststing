//
//  ShoppingCartTests.swift
//  DemoAppTests
//
//  Created by Tima Sikorski on 13/11/2023.
//

import XCTest
@testable import DemoApp

class DummyCheckoutPageOpener: CheckoutPageOpener {
    private(set) var products: [Product] = []
    private(set) var finalPrice: Int = 0

    func openCheckoutPage(for products: [DemoApp.Product], finalPrice: Int) {
        self.products = products
        self.finalPrice = finalPrice
    }
}

class ShoppingCartTests: XCTestCase {
    func testCheckout() {
        // Given
        let checkoutPageOpener = DummyCheckoutPageOpener()
        let cart = ShoppingCart(checkoutPageOpener: checkoutPageOpener)
        let product = Product(name: "Product 1", cost: 10)
        let coupon = Coupon(code: "Coupon", discountPercentage: 20)

        // When
        cart.add(product)
        cart.apply(coupon)
        cart.startCheckout()

        // Then
        XCTAssertEqual(checkoutPageOpener.products, [product])
        XCTAssertEqual(checkoutPageOpener.finalPrice, 8)
    }
}
