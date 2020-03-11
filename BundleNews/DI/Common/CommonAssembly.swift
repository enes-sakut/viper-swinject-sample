//
//  CommonAssembly.swift
//  BundleNews
//
//  Created by Enes Sakut on 15.02.2020.
//  Copyright © 2020 Enes Sakut. All rights reserved.
//

import Foundation
import Swinject

class CommonAssembly: Assembly {
    
    func assemble(container: Container) {
    
        container.register(UIApplication.self) { r in
            UIApplication.shared
            }.inObjectScope(.container)
    
        
        container.register(Bundle.self) { r in
            Bundle.main
            }.inObjectScope(.container)
    }
}
