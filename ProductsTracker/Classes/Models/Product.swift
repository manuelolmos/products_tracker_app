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
    
    init(name: String, prize: Double, date: String, seller: String) {
        self.name = name
        self.prize = prize
        self.date = date
        self.seller = seller
    }
}
