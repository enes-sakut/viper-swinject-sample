//
//  UIServiceAssembly.swift
//  BundleNews
//
//  Created by Enes Sakut on 15.02.2020.
//  Copyright © 2020 Enes Sakut. All rights reserved.
//

import Foundation
import Swinject

class UIServiceAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(AlertService.self) { r in
            AlertServiceImpl()
        }
    }
}
