//
//  Product.swift
//  ProductsTracker
//
//  Created by Manuel Olmos Gil on 10/11/2018.
//  Copyright © 2018 Manuel Olmos Gil. All rights reserved.
//

import UIKit

class Product: NSObject {

    var name: String
    var prize: Double
    var date: String
    var seller: String

    init?(dictionary: [String: Any]?) {
        guard let dict = dictionary, let name = dict["name"] as? String,
            let prize = dict["prize"] as? Double,
            let date = dict["date"] as? String,
            let seller = dict["seller"] as? String else {
                return nil
        }
        self.name = name
        self.prize = prize
        self.date = date
        self.seller = seller
    }

    init(name: String, prize: Double, date: String, seller: String) {
        self.name = name
        self.prize = prize
        self.date = date
        self.seller = seller
    }
}
