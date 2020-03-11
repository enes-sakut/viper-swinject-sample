//
//  ProductDetailInteractor.swift
//  BundleNews
//
//  Created by Enes Sakut on 20.02.2020.
//  Copyright © 2020 Enes Sakut. All rights reserved.
//

import Foundation

protocol ProductDetailInteractor {
     var presenter: ProductDetailPresenter! { get set }
    
    func presentView()
    func getData(data: ProductDetails.Config)
}

class ProductDetailInteractorImpl: ProductDetailInteractor {
 
    
     var presenter: ProductDetailPresenter!
    
    func presentView() {
        presenter.presentViewType()
     }
    
    
    func getData(data: ProductDetails.Config) {
        presenter.presentData(data)
    }
}
