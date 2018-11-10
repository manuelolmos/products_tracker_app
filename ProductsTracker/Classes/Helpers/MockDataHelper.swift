//
//  MockDataHelper.swift
//  ProductsTracker
//
//  Created by Manuel Olmos Gil on 10/11/2018.
//  Copyright © 2018 Manuel Olmos Gil. All rights reserved.
//

import UIKit

class MockDataHelper: NSObject {

    // TODO: Next step should be getting from a json locally
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
