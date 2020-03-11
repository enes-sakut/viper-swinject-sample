//
//  BundleMainPresenter.swift
//  BundleNews
//
//  Created by Enes Sakut on 15.02.2020.
//  Copyright © 2020 Enes Sakut. All rights reserved.
//

import UIKit

protocol BundleMainPresenter {
    
    var view: BundleMainTableViewController! { get set }
    
    func presentData(_ response: ProductData.Data.Response)
}


class BundleMainPresenterImpl: BundleMainPresenter {
    
    weak var view: BundleMainTableViewController!

    
    func presentData(_ response:  ProductData.Data.Response) {
        let viewModels = response.models.map { data -> ProductData.Data.ViewModel in
            let category = data.productInfo.category
            let productName =  data.productInfo.name
            let price = data.productInfo.price
            let imageUrl = data.productInfo.image
            
            return ProductData.Data.ViewModel(productImageUrl: imageUrl,
                                              productType: category,
                                              productName: productName,
                                              productPrice: price,
                                              model: data)
        }
        if let view = self.view {
            view.displayData(viewModels)
        }
    }
}
