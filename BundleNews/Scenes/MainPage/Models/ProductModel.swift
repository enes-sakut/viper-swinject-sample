//
//  ProductDataModel.swift
//  BundleNews
//
//  Created by Enes Sakut on 15.02.2020.
//  Copyright © 2020 Enes Sakut. All rights reserved.
//

import UIKit

struct ProductData {
    
    struct Data {
        
        struct Response {
            
            let models: [ProductDataModel]
        }
        
        struct ViewModel {
            
            let productImageUrl: String?
            let productType: String?
            let productName: String?
            let productPrice: String?
            let model: ProductDataModel
        }
    }
}
