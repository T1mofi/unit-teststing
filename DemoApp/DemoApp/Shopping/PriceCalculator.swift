//
//  PriceListCalculator.swift
//  DemoApp
//
//  Created by Tima Sikorski on 13/11/2023.
//

import Foundation

class PriceCalculator {
    static func calculateFinalPrice(for products: [Product], with coupon: Coupon? = nil) -> Int {
        var finalPrice = products.reduce(0) { price, product in
            return price + product.cost
        }

        if let coupon = coupon {
            let multiplier = coupon.discountPercentage / 100
            let discount = Double(finalPrice) * multiplier
            finalPrice -= Int(discount)
        }

        return finalPrice
    }
}
