//
//  AlertService.swift
//  BundleNews
//
//  Created by Enes Sakut on 15.02.2020.
//  Copyright © 2020 Enes Sakut. All rights reserved.
//

import UIKit

protocol AlertService {
    
    func alertController(title: String, message: String) -> UIAlertController
    
    @discardableResult
    func alertController(
        title: String,
        message: String,
        preferredStyle: UIAlertController.Style,
        actions: [UIAlertAction],
        viewController: UIViewController) -> UIAlertController
    
    @discardableResult
    func alertControllerWithDismissButton(
        title: String,
        message: String,
        buttonTitle: String,
        preferredStyle: UIAlertController.Style,
        viewController: UIViewController) -> UIAlertController
    
    @discardableResult
    func alertControllerWithPosNegButton(
        title: String,
        message: String,
        posButtonTitle: String,
        negButtonTitle: String,
        preferredStyle: UIAlertController.Style,
        viewController: UIViewController) -> UIAlertController
}

class AlertServiceImpl: AlertService {
    
    func alertController(title: String, message: String) -> UIAlertController {
        return UIAlertController(title: title, message: message, preferredStyle: .alert)
    }
    
    func alertController(
        title: String,
        message: String,
        preferredStyle: UIAlertController.Style,
        actions: [UIAlertAction],
        viewController: UIViewController) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        for action in actions {
            alertController.addAction(action)
        }
        viewController.present(alertController, animated: true, completion: nil)
        return alertController
    }
    
    func alertControllerWithDismissButton(
        title: String,
        message: String,
        buttonTitle: String,
        preferredStyle: UIAlertController.Style,
        viewController: UIViewController) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        let dismissAction = UIAlertAction(title: buttonTitle, style: .default)
        alertController.addAction(dismissAction)
        viewController.present(alertController, animated: true, completion: nil)
        return alertController
    }
    
    func alertControllerWithPosNegButton(
        title: String,
        message: String,
        posButtonTitle: String,
        negButtonTitle: String,
        preferredStyle: UIAlertController.Style,
        viewController: UIViewController) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        let posAction = UIAlertAction(title: posButtonTitle, style: .default)
        alertController.addAction(posAction)
        let negAction = UIAlertAction(title: negButtonTitle, style: .cancel)
        alertController.addAction(negAction)
        viewController.present(alertController, animated: true, completion: nil)
        return alertController
    }
}


