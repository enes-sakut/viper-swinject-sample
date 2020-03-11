//
//  ProductDetailPresenter.swift
//  BundleNews
//
//  Created by Enes Sakut on 20.02.2020.
//  Copyright © 2020 Enes Sakut. All rights reserved.
//
import UIKit

protocol ProductDetailPresenter {
    var view: ProductDetailViewContoller! { get set }
    
    func presentViewType()
    func presentData(_ data: ProductDetails.Config)
}

class ProductDetailPresenterImpl: ProductDetailPresenter {
    
    
    var view: ProductDetailViewContoller!
    
    func presentViewType() {
        let viewModel = { () -> ProductDetails.InitUI.ViewModel in
             return ProductDetails.InitUI.ViewModel(title: "ÜRÜN DETAYI", color: UIColor.bundleGrey)
        }()
        self.view.displayView(viewModel)
    }
    
    func presentData(_ data: ProductDetails.Config) {
        self.view.showDetails(data: data)
    }
}

