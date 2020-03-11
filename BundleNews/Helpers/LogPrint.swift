//
//  LogPrint.swift
//  BundleNews
//
//  Created by Enes Sakut on 20.02.2020.
//  Copyright © 2020 Enes Sakut. All rights reserved.
//

import Foundation

func currentDateString() -> String {
    let df = DateFormatter()
    df.dateFormat = "dd-MM HH:mm:ss.SSSS"
    return df.string(from: Date())
}

func dlog(
    _ tag: AnyObject,
    _ items: Any...) {
 
    var list : [Any] = []
    let logInfo = currentDateString() + " " + String(describing: tag)
    list.append(logInfo)
    list.append(contentsOf: items)
    print(list, separator: " ", terminator: "\n")
   
}
