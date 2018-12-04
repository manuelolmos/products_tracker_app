//
//  ProductAPI.swift
//  ProductsTracker
//
//  Created by Manuel Olmos Gil on 03/12/2018.
//  Copyright © 2018 Manuel Olmos Gil. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class ProductAPI: NSObject {

    static private let productsResourceUrl = "http://localhost:8080/products"

    static func getAllProducts(completion: (([Product]?) -> Void)? = nil) {
        Alamofire.request(ProductAPI.productsResourceUrl).responseArray { (response: DataResponse<[Product]>) in
            completion?(response.result.value)
        }
    }

    static func getProduct(productId: String?, completion: ((Product?) -> Void)? = nil) {
        guard let productId = productId else {
            return
        }
        let url = ProductAPI.productsResourceUrl + "/" + productId
        Alamofire.request(url).responseObject { (response: DataResponse<Product>) in
            completion?(response.result.value)
        }
    }

}
