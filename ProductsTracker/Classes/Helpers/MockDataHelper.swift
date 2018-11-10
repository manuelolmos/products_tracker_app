//
//  MockDataHelper.swift
//  ProductsTracker
//
//  Created by Manuel Olmos Gil on 10/11/2018.
//  Copyright © 2018 Manuel Olmos Gil. All rights reserved.
//

import UIKit

class MockDataHelper: NSObject {

    func mockProductsDataFromJson() -> [Product] {
        var mockProducts = [Product]()
        if let path = Bundle.main.path(forResource: "products", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? [String: AnyObject],
                    let products = jsonResult["products"] as? [Any] {
                    for productDict in products {
                        if let product = Product(dictionary: productDict as? [String: Any]) {
                            mockProducts.append(product)
                        }
                    }
                }
            } catch {
                print("Err: could not load from json file")
            }
        }
        return mockProducts
    }

    func mockProductsData() -> [Product] {
        var mockProducts = [Product]()
        mockProducts.append(Product(name: "Leche", prize: 100, date: "10/3", seller: "Carrefour"))
        mockProducts.append(Product(name: "Azucar", prize: 50, date: "10/3", seller: "Carrefour"))
        mockProducts.append(Product(name: "Manteca", prize: 32, date: "10/3", seller: "Carrefour"))
        mockProducts.append(Product(name: "Leche", prize: 80, date: "10/3", seller: "Coto"))
        mockProducts.append(Product(name: "Azucar", prize: 20, date: "10/3", seller: "Coto"))
        mockProducts.append(Product(name: "Manteca", prize: 28, date: "10/3", seller: "Coto"))
        return mockProducts
    }
}
