//
//  ProductTableViewCell.swift
//  ProductsTracker
//
//  Created by Manuel Olmos Gil on 10/11/2018.
//  Copyright © 2018 Manuel Olmos Gil. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var prizeLabel: UILabel!
    @IBOutlet weak var sellerLabel: UILabel!
    @IBOutlet weak var prizeDateLabel: UILabel!

    func setupUI(product: Product) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        self.prizeLabel.text = formatter.string(for: product.prize)
        self.productNameLabel.text = product.name
        self.sellerLabel.text = product.seller
        self.prizeDateLabel.text = product.date
    }
}
