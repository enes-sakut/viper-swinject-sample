//
//  BundleMainAssembly.swift
//  BundleNews
//
//  Created by Enes Sakut on 15.02.2020.
//  Copyright © 2020 Enes Sakut. All rights reserved.
//

import UIKit
import Swinject

class BundleMainAssembly: Assembly {
    
    
    func assemble(container: Container) {
        container.register(BundleMainTableViewController.self) { r in
            let view = BundleMainTableViewControllerImpl(nibName: "BundleMainTableViewController", bundle: nil)
            view.alertService = r.resolve(AlertService.self)!
            
            var interactor = r.resolve(BundleMainInteractor.self)!
            var presenter = r.resolve(BundleMainPresenter.self)!
            let router = r.resolve(BundleMainRouter.self)!
            
            view.interactor = interactor
            interactor.presenter = presenter
            presenter.view = view
            
            view.bundle = r.resolve(Bundle.self)!
            view.router = router
            return view
        }
        
        container.register(BundleMainInteractor.self) { r in
            BundleMainInteractorImpl(bundleMainService: r.resolve(BundleMainService.self)!)
        }
        
        container.register(BundleMainPresenter.self) { r in
            BundleMainPresenterImpl()
        }
        
        
        container.register(BundleMainRouter.self) { r in
            BundleMainRouterImpl(
                viewControllerFactory: r.resolve(ViewControllerFactory.self)!
            )
        }
    }
}

