//
//  LaunchScreenExtensionRouter.swift
//  BundleNews
//
//  Created by Enes Sakut on 21.02.2020.
//  Copyright © 2020 Enes Sakut. All rights reserved.
//

import UIKit

protocol LaunchScreenExtensionRouter {
    func navigateToStart(from viewController: UIViewController)
   
}

class LaunchScreenExtensionRouterImpl: LaunchScreenExtensionRouter {
    
    private let viewControllerFactory: ViewControllerFactory
    
    init(viewControllerFactory: ViewControllerFactory) {
        self.viewControllerFactory = viewControllerFactory
    }
    
    // TODO: Try to integrate this also into NavigateToMainRouter
   
    
    func navigateToStart(from viewController: UIViewController) {
        let next = self.viewControllerFactory.navigateMainPage()
        
        let navController = self.viewControllerFactory.bundleNavController()
        navController.setViewControllers([next as! UIViewController], animated: false)
        navController.modalPresentationStyle = .fullScreen
        
        viewController.present(navController, animated: true)
    }
    
   
}

