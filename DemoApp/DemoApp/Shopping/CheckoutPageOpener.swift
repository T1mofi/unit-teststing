//
//  CheckoutPageOpener.swift
//  DemoApp
//
//  Created by Tima Sikorski on 13/11/2023.
//

import Foundation

protocol CheckoutPageOpener {
    func openCheckoutPage(for products: [Product],
                          finalPrice: Int)
}
