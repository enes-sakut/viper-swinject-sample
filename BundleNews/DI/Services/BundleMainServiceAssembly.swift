//
//  BundleMainServiceAssembly.swift
//  BundleNews
//
//  Created by Enes Sakut on 15.02.2020.
//  Copyright © 2020 Enes Sakut. All rights reserved.
//

import Foundation
import Swinject


class BundleMainServiceAssembly: Assembly {
    func assemble(container: Container) {
        
        container.register(BundleMainService.self) { r in
            BundleMainServiceImpl()
            }.inObjectScope(.container)
    }
}
