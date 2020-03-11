//
//  ProductDetailAssembly.swift
//  BundleNews
//
//  Created by Enes Sakut on 20.02.2020.
//  Copyright © 2020 Enes Sakut. All rights reserved.
//

import UIKit
import Swinject

class ProductDetailAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(ProductDetailViewContoller.self) { r in
            let view = ProductDetailViewControllerImpl(nibName: "ProductDetailViewController", bundle: nil)
            
            var interactor = r.resolve(ProductDetailInteractor.self)!
            var presenter = r.resolve(ProductDetailPresenter.self)!
            let router = r.resolve(ProductDetailRouter.self)!
            
            view.interactor = interactor
            interactor.presenter = presenter
            presenter.view = view
            view.router = router
            
            return view
        }
        
        container.register(ProductDetailInteractor.self) { r in
            ProductDetailInteractorImpl()
        }
        
        container.register(ProductDetailPresenter.self) { r in
            ProductDetailPresenterImpl()
        }
        
        container.register(ProductDetailRouter.self) { r in
            ProductDetailRouterImpl(
                viewControllerFactory: r.resolve(ViewControllerFactory.self)!,
                uiEntryPoint: r.resolve(UIEntryPoint.self)!
            )
        }
    }
}
