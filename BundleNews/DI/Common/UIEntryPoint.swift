//
//  UIEntryPoint.swift
//  BundleNews
//
//  Created by Enes Sakut on 15.02.2020.
//  Copyright © 2020 Enes Sakut. All rights reserved.
//

import UIKit

protocol UIEntryPoint: class {
    
    var rootViewController: UIViewController? { get set }
}
