//
//  Router.swift
//  DemoApp
//
//  Created by Tima Sikorski on 11/11/2023.
//

import Foundation

class Router: CheckoutPageOpener {
    static let shared = Router()

    func openCheckoutPage(for products: [Product],
                          finalPrice: Int) {
        // show checkout page
    }
}
