//
//  ProductDetailRouter.swift
//  BundleNews
//
//  Created by Enes Sakut on 21.02.2020.
//  Copyright © 2020 Enes Sakut. All rights reserved.
//

import UIKit

protocol ProductDetailRouter: NavigateToMainRouter {
   
}

class ProductDetailRouterImpl: ProductDetailRouter {
    
    var uiEntryPoint: UIEntryPoint
    var viewControllerFactory: ViewControllerFactory
    
    init(viewControllerFactory: ViewControllerFactory, uiEntryPoint: UIEntryPoint) {
        self.viewControllerFactory = viewControllerFactory
        self.uiEntryPoint = uiEntryPoint
    }
}
