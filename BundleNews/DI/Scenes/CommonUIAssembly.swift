//
//  CommonUIAssembly.swift
//  BundleNews
//
//  Created by Enes Sakut on 15.02.2020.
//  Copyright © 2020 Enes Sakut. All rights reserved.
//

import UIKit
import Swinject

class CommonUIAssembly: Assembly {
    
    private let assembler: Assembler
    private let uiEntryPoint: UIEntryPoint
    
    init(assembler: Assembler, uiEntryPoint: UIEntryPoint) {
        self.assembler = assembler
        self.uiEntryPoint = uiEntryPoint
    }
    
    func assemble(container: Container) {
        container.register(BundleNavigationController.self) { r in
            let vc = BundleNavigationController()
            let delegate = BundleNavigationControllerDelegate()
            vc.strongDelegateReference = delegate
            delegate.setupNavController(navigationController: vc)
            return vc
        }
        
        container.register(ViewControllerFactory.self) { r in
            ViewControllerFactoryImpl(assembler: self.assembler)
        }
        
        container.register(UIEntryPoint.self) { r in
            self.uiEntryPoint
        }.inObjectScope(.container)
    }
}
