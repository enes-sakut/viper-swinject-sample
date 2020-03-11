//
//  UIViewController+ Title.swift
//  BundleNews
//
//  Created by Enes Sakut on 20.02.2020.
//  Copyright © 2020 Enes Sakut. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setBundleDetailTitle(_ title: String) {
        setBundleDetailTitle(title, color: UIColor.bundleGrey)
    }
    
    func setBundleDetailTitle(_ title: String,  color: UIColor) {
        let titleLabel = UILabel()
        let titleAttributes: [String : Any] = [
            convertFromNSAttributedStringKey(NSAttributedString.Key.font): UIFont(name: "Roboto-Regular", size: 13)!,
            convertFromNSAttributedStringKey(NSAttributedString.Key.kern): 3,
            convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): color
        ]

        titleLabel.attributedText = NSAttributedString(string: title, attributes: convertToOptionalNSAttributedStringKeyDictionary(titleAttributes))
        titleLabel.sizeToFit()

        self.navigationItem.titleView = titleLabel
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
    return input.rawValue
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
    guard let input = input else { return nil }
    return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}
