//
//  ViewController.swift
//  ProductsTracker
//
//  Created by Manuel Olmos Gil on 10/11/2018.
//  Copyright © 2018 Manuel Olmos Gil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var productTableView: UITableView!
    private let searchController = UISearchController(searchResultsController: nil)
    fileprivate var products = [Product]()
    fileprivate var filteredProducts = [Product]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        ProductAPI.getAllProducts { (products: [Product]?) in
            if let productsArray = products {
                self.products = productsArray
                self.productTableView.reloadData()
            }
        }
    }

    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search products"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    private func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }

    private func filterContentForSearchText(_ searchText: String) {
        filteredProducts = products.filter({( product: Product) -> Bool in
            var validProduct = false
            if let name = product.name {
                validProduct = name.lowercased().contains(searchText.lowercased())
            }
            return validProduct
        })
        productTableView.reloadData()
    }

    private func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredProducts.count
        }
        return products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ProductTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ProductCell")
            as! ProductTableViewCell
        // swiftlint:disable:previous force_cast
        let product: Product
        if isFiltering() {
            product = filteredProducts[indexPath.row]
        } else {
            product = products[indexPath.row]
        }
        cell.setupUI(product: product)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let productDetailVC = storyboard.instantiateViewController(withIdentifier: "ProductDetailVC")
            as? ProductDetailViewController {
            let product = self.products[indexPath.row]
            productDetailVC.productId = product.name
            self.navigationController?.pushViewController(productDetailVC, animated: true)
        }
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
