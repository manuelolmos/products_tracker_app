//
//  ProductDetailViewController.swift
//  ProductsTracker
//
//  Created by Manuel Olmos Gil on 26/11/2018.
//  Copyright © 2018 Manuel Olmos Gil. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var productDate: UILabel!
    @IBOutlet weak var productSeller: UILabel!
    @IBOutlet weak var productPrize: UILabel!

    private var product: Product?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = product?.name
        self.productDate.text = product?.date
        self.productSeller.text = product?.seller
        self.productPrize.text = String(product?.prize ?? 0)
    }

    func setupUI(product: Product) {
        self.product = product
    }
}
