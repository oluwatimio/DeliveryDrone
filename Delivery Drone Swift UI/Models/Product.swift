//
//  Product.swift
//  Delivery Drone Swift UI
//
//  Created by Timi Owoturo on 2020-01-04.
//  Copyright © 2020 CEG4912. All rights reserved.
//

import Foundation
import Promise

struct Product: Identifiable {
    let name: String;
    let id: String;
    let imageLink: String;
    let price: String;
    let category: String;
    init(name: String, id: String, imageLink: String, price: String, category: String) {
        self.name = name;
        self.id = id;
        self.imageLink = imageLink;
        self.price = price;
        self.category = category;
    }
}
