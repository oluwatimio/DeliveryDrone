//
//  ProductOrderPending.swift
//  Delivery Drone Swift UI
//
//  Created by Timi Owoturo on 2020-01-15.
//  Copyright © 2020 CEG4912. All rights reserved.
//

import Foundation

struct ProductOrderPending: Identifiable {
    let name: String;
    let id: String;
    let imageLink: String;
    let price: String;
    let category: String;
    let count: Int;
    let qrCode: String;
    init(name: String, id: String, imageLink: String, price: String, category: String, count: Int, qrCode: String) {
        self.name = name;
        self.id = id;
        self.imageLink = imageLink;
        self.price = price;
        self.category = category;
        self.count = count;
        self.qrCode = qrCode
    }
    
//    enum CodingKeys: String, CodingKey {
//        case name
//        case id
//        case imageLink
//        case price
//        case category;
//        case count;
//        case qrCode;
//    }
}
