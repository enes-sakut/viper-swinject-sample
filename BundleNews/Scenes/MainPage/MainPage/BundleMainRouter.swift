//
//  BundleMainRouter.swift
//  BundleNews
//
//  Created by Enes Sakut on 15.02.2020.
//  Copyright © 2020 Enes Sakut. All rights reserved.
//

import UIKit

protocol BundleMainRouter {
    func navigateToDetails(pData: ProductInfo, from viewController: UIViewController)
}

class BundleMainRouterImpl: BundleMainRouter {

    internal let viewControllerFactory: ViewControllerFactory
    
    
    init(viewControllerFactory: ViewControllerFactory ) {

        self.viewControllerFactory = viewControllerFactory
    }
    
    //if the user click the product go to main page
    func navigateToDetails(pData: ProductInfo, from viewController: UIViewController) {
        var next = viewControllerFactory.navigateProductDetail()
         next.config = ProductDetails.Config(data: pData)
        guard let nextVC = next as? UIViewController else { return }
        nextVC.loadViewIfNeeded()
       viewController.navigationController?.pushViewController(nextVC, animated: true)
    }
}
