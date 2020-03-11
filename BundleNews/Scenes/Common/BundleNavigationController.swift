//
//  BundleNavigationController.swift
//  BundleNews
//
//  Created by Enes Sakut on 15.02.2020.
//  Copyright © 2020 Enes Sakut. All rights reserved.
//

import UIKit

class BundleNavigationController: UINavigationController {
    
    var strongDelegateReference: BundleNavigationControllerDelegate? {
        didSet {
            self.delegate = self.strongDelegateReference
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationBar.tintColor = UIColor.black
        self.navigationBar.topItem?.title = ""
        self.modalPresentationStyle = .fullScreen
         self.navigationBar.barTintColor = .white
    }
}
