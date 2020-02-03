//
//  Categories.swift
//  Delivery Drone Swift UI
//
//  Created by Timi Owoturo on 2020-01-04.
//  Copyright © 2020 CEG4912. All rights reserved.
//

import Foundation

class Category : Identifiable {
    var imageLink: String;
    var category: String;
    var title: String;
    var subtitle: String;
    init (imageLink: String, category: String, title: String, subtitle: String) {
        self.imageLink = imageLink;
        self.category = category;
        self.title = title;
        self.subtitle = subtitle;
    }
    
    static func getCategories() -> [Category] {
        let p1 = Category(imageLink: "man", category: "Men's Accessories", title: "MAN", subtitle: "")
        let p2 = Category(imageLink: "woman", category: "Women's Accessories", title: "WOMAN", subtitle: "")
        let p3 = Category(imageLink: "kid", category: "Kid's Accessories", title: "KIDS", subtitle: "")
        let p4 = Category(imageLink: "phone", category: "Phone Accessories", title: "PHONE", subtitle: "")
        
        return [p1,p2,p3,p4]
    }
}
