//
//  ShoppingCartViewController.swift
//  DemoApp
//
//  Created by Tima Sikorski on 11/11/2023.
//

import UIKit

class ShoppingCartViewController: UIViewController {
    var cart: ShoppingCart?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        cart = ShoppingCart()
        cart?.add(Product(name: "Oil filter", cost: 10))
        cart?.add(Product(name: "Fuel filter", cost: 5))
        cart?.apply(Coupon(code: "NY", discountPercentage: 20))
    }

    @objc func checkoutButtonTapped() {
        cart?.startCheckout()
    }
}
