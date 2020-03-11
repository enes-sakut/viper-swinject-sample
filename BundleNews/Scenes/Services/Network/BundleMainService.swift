//
//  BundleMainService.swift
//  BundleNews
//
//  Created by Enes Sakut on 15.02.2020.
//  Copyright © 2020 Enes Sakut. All rights reserved.
//

import Foundation

import Foundation
import Alamofire
import BoltsSwift

protocol BundleMainService {
    func get() -> Task<[ProductDataModel]>
}

class BundleMainServiceImpl: BundleMainService {
    
    private let url: String
    
    init() {
        url = "http://5e209e06e31c6e0014c60962.mockapi.io/api/products"
        
    }
    
    func get() -> Task<[ProductDataModel]> {
        let tcs = TaskCompletionSource<[ProductDataModel]>()
        var models = [ProductDataModel]()
        var products = [ProductInfo]()
        
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result{
                case .success(let json):
                    print(json)
                    guard let jsonArray = json as? [[String: Any]] else {
                        return
                    }
                    products = jsonArray.compactMap{ProductInfo(dict: $0)}
                    
                    for idx in 0..<products.count {
                        let model = ProductDataModel(productInfo: products[idx])
                        models.append(model)
                    }
                    tcs.set(result: models)
                    
                case let .failure(error):
                    print("error: \(error)")
                    tcs.set(error: error)
                }
        }
        
        return tcs.task
    }
    
}



