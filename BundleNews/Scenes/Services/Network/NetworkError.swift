
//
//  NetworkError.swift
//  BundleNews
//
//  Created by Enes Sakut on 15.02.2020.
//  Copyright © 2020 Enes Sakut. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case unknown
    case noConnection
    case connectionRefused
    case timeout
    case notFound
}
