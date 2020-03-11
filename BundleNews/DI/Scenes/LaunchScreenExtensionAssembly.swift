//
//  LaunchScreenExtensionAssembly.swift
//  BundleNews
//
//  Created by Enes Sakut on 15.02.2020.
//  Copyright © 2020 Enes Sakut. All rights reserved.
//

import UIKit
import Swinject

class LaunchScreenExtensionAssembly: Assembly {

    func assemble(container: Container) {
        container.register(LaunchScreenExtensionViewController.self) { r in
            let view = LaunchScreenExtensionViewControllerImpl(nibName: "LaunchScreenExtensionViewController", bundle: nil)

            let interactor = r.resolve(LaunchScreenExtensionInteractor.self)!
            let router = r.resolve(LaunchScreenExtensionRouter.self)!

            view.interactor = interactor
            view.router = router

            return view
        }

        container.register(LaunchScreenExtensionInteractor.self) { r in
            LaunchScreenExtensionInteractorImpl()
        }

        container.register(LaunchScreenExtensionRouter.self) { r in
            LaunchScreenExtensionRouterImpl(viewControllerFactory: r.resolve(ViewControllerFactory.self)!)
        }
    }
}

