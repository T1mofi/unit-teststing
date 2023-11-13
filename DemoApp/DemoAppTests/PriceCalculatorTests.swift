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
            Product(name: "Lubricant", cost: 25),
            Product(name: "Fuel pump", cost: 4800)
        ]

        let result = PriceCalculator.calculateFinalPrice(for: products)

        XCTAssertEqual(result, 4825)
    }

    func testPriceCalculationWithCoupon() {
        let products = [
            Product(name: "Breaking pad", cost: 200),
            Product(name: "Fuel pump", cost: 4800)
        ]
        let coupon = Coupon(code: "VSVLAS", discountPercentage: 3.5)

        let result = PriceCalculator.calculateFinalPrice(for: products, with: coupon)

        XCTAssertEqual(result, 4825)
    }
}
