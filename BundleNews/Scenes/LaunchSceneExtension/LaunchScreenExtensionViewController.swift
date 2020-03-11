//
//  LaunchScreenExtensionViewController.swift
//  BundleNews
//
//  Created by Enes Sakut on 21.02.2020.
//  Copyright © 2020 Enes Sakut. All rights reserved.
//

import UIKit

protocol LaunchScreenExtensionViewController: class {

    var interactor: LaunchScreenExtensionInteractor! { get set }
    var router: LaunchScreenExtensionRouter! { get set }
}

class LaunchScreenExtensionViewControllerImpl: UIViewController, LaunchScreenExtensionViewController {

    var interactor: LaunchScreenExtensionInteractor!
    var router: LaunchScreenExtensionRouter!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.router.navigateToStart(from: self)
        
    }
}
