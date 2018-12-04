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

    var productId: String?
    private var product: Product?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.requestProduct(productId: self.productId, completion: { (product: Product?) in
            self.product = product
            self.setupUI()
        })
    }

    private func setupUI() {
        self.title = product?.name
        self.productDate.text = product?.date
        self.productSeller.text = product?.seller
        self.productPrize.text = String(product?.prize ?? 0)
    }

    private func requestProduct(productId: String?, completion: ((Product?) -> Void)? = nil) {
        self.productId = productId
        ProductAPI.getProduct(productId: self.productId) { (product) in
            completion?(product)
        }
    }
}
