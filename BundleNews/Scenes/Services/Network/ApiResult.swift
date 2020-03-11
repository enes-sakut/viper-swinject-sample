//
//  ApiResult.swift
//  BundleNews
//
//  Created by Enes Sakut on 15.02.2020.
//  Copyright © 2020 Enes Sakut. All rights reserved.
//

import Foundation

struct ApiResult {
    
    let success: Bool
    let message: String
    
    init(dict: Dictionary<String, AnyObject>) {
        self.success = dict["success"] as! Bool
        self.message = (dict["message"] as! String).lowercased()
    }
}
