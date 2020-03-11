//
//  NavigateToMainRouter.swift
//  BundleNews
//
//  Created by Enes Sakut on 19.02.2020.
//  Copyright © 2020 Enes Sakut. All rights reserved.
//

import UIKit

protocol NavigateToMainRouter {

    var uiEntryPoint: UIEntryPoint { get }
    var viewControllerFactory: ViewControllerFactory { get }

    func navigateToMain(from viewController: UIViewController)
}

extension NavigateToMainRouter {

    func navigateToMain(from viewController: UIViewController) {
        let next = self.viewControllerFactory.navigateMainPage()
       
        let navController = self.viewControllerFactory.bundleNavController()
        navController.setViewControllers([next as! UIViewController], animated: false)
        navController.modalPresentationStyle = .fullScreen
        
        let launchScreenExtensionViewController = self.uiEntryPoint.rootViewController!
        let startNavController = launchScreenExtensionViewController.presentedViewController! as! UINavigationController

        let startViewController = startNavController.children.first!
        startNavController.setViewControllers([startViewController], animated: false)

        viewController.dismiss(animated: true)

        dlog(self as AnyObject, "startViewController: \(startViewController)")
        dlog(self as AnyObject, "startNavController: \(startNavController)")
        dlog(self as AnyObject, "next: \(next)")

        startNavController.modalPresentationStyle = .fullScreen
        
        startNavController.present(navController, animated: true)
    }
}

