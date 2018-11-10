//
//  ViewController.swift
//  ProductsTracker
//
//  Created by Manuel Olmos Gil on 10/11/2018.
//  Copyright © 2018 Manuel Olmos Gil. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var productTableView: UITableView!
    var products = [Product]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.products = MockDataHelper().mockProductsData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ProductTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ProductCell")
            as! ProductTableViewCell
        // swiftlint:disable:previous force_cast
        cell.setupUI(product: self.products[indexPath.row])
        return cell
    }
}
