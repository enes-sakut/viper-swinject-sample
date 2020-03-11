//
//  ProductInfo.swift
//  BundleNews
//
//  Created by Enes Sakut on 17.02.2020.
//  Copyright © 2020 Enes Sakut. All rights reserved.
//

import Foundation

struct ProductInfo {
    
    let id: String?
    let category: String?
    let name: String?
    let price: String?
    let image: String?
    
    
    init(dict:[String: Any]) {
        self.id = (dict["id"] as! String)
        self.category = (dict["category"]! as! String)
        self.name = (dict["name"]! as! String)
        self.price = (dict["price"]! as! String)
        self.image = (dict["image"]! as! String)
    }
}
