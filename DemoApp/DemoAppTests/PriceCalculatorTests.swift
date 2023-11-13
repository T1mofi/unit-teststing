//
//  PriceCalculatorTests.swift
//  DemoAppTests
//
//  Created by Tima Sikorski on 13/11/2023.
//

import XCTest
@testable import DemoApp

class PriceCalculatorTests: XCTestCase {
    func testPriceCalculationWithoutCoupon() {
        let products = [
            Product(cost: 25),
            Product(cost: 4800)
        ]

        let result = PriceCalculator.calculateFinalPrice(for: products)

        XCTAssertEqual(result, 4825)
    }

    func testPriceCalculationWithCoupon() {
        let products = [
            Product(cost: 200),
            Product(cost: 4800)
        ]
        let coupon = Coupon(discountPercentage: 3.5)

        let result = PriceCalculator.calculateFinalPrice(for: products, with: coupon)

        XCTAssertEqual(result, 4825)
    }
}
