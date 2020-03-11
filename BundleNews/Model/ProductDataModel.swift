//
//  ProductDataModel.swift
//  BundleNews
//
//  Created by Enes Sakut on 15.02.2020.
//  Copyright © 2020 Enes Sakut. All rights reserved.
//

import Foundation
import AFDateHelper
import Alamofire

struct ProductDataModel {
    let productInfo: ProductInfo

    init(productInfo : ProductInfo) {
        self.productInfo = productInfo
    }
}
