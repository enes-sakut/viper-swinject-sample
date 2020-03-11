//
//  ViewCotrollerFactory.swift
//  BundleNews
//
//  Created by Enes Sakut on 15.02.2020.
//  Copyright © 2020 Enes Sakut. All rights reserved.
//

import Foundation

import Swinject
import UIKit

protocol ViewControllerFactory {
    
    func bundleNavController() -> BundleNavigationController
    
    func navigateMainPage() -> BundleMainTableViewController
    
    func navigateProductDetail() -> ProductDetailViewContoller
    
}

class ViewControllerFactoryImpl: ViewControllerFactory {
   
    

    private let assembler: Assembler
    
    init(assembler: Assembler) {
        self.assembler = assembler
    }
    
    func bundleNavController() -> BundleNavigationController {
            return self.assembler.resolver.resolve(BundleNavigationController.self)!
       }
        
    func navigateMainPage() -> BundleMainTableViewController {
        return self.assembler.resolver.resolve(BundleMainTableViewController.self)!
    }
    
    func navigateProductDetail() -> ProductDetailViewContoller {
     return self.assembler.resolver.resolve(ProductDetailViewContoller.self)!
    }
    
}
