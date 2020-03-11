//
//  BundleNavigationControllerDelegate.swift
//  BundleNews
//
//  Created by Enes Sakut on 15.02.2020.
//  Copyright © 2020 Enes Sakut. All rights reserved.
//

import UIKit

class BundleNavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    
    let imageView: UIImageView
    
    override init() {
        let image = UIImage(named: "bundle-nav-icon")!
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.imageView = imageView
    }
    
    func setupNavController(navigationController: BundleNavigationController) {
        navigationController.navigationBar.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: navigationController.navigationBar.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: navigationController.navigationBar.centerYAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: navigationController.navigationBar.bottomAnchor).isActive = true
      
    }
    
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
          if  (!viewController.isKind(of: BundleMainTableViewControllerImpl.self)) {
                  imageView.isHidden = true
          }
          
          navigationController.navigationBar.topItem?.title = ""
      }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if viewController.isKind(of: BundleMainTableViewControllerImpl.self){
            imageView.isHidden = false
        }
    }
    
}

