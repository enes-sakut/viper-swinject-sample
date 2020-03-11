//
//  BundleMainInteractor.swift
//  BundleNews
//
//  Created by Enes Sakut on 15.02.2020.
//  Copyright © 2020 Enes Sakut. All rights reserved.
//

import Foundation


protocol BundleMainInteractor {
    
    var presenter: BundleMainPresenter! { get set }
    
    func shouldShowLoadingMoreDataMessage() -> Bool
    func loadData()
    
}

class BundleMainInteractorImpl: BundleMainInteractor {
    
    var presenter: BundleMainPresenter!
    
    var data: [ProductDataModel]
    var moreDataAvailable: Bool = true
    
    private let bundleMainService: BundleMainService
    
    init(bundleMainService: BundleMainService) {
        self.bundleMainService = bundleMainService
        self.data = []
    }
    
    func shouldShowLoadingMoreDataMessage() -> Bool {
        return self.moreDataAvailable
    }
    
    func loadData() {
        self.bundleMainService.get()
            .continueOnSuccessWith { models in
                self.process(models)
            }
            .continueOnErrorWith { _ in
                self.moreDataAvailable = false
        }
    }
    
    private func process(_ data: [ProductDataModel]) {
        self.presenter.presentData(ProductData.Data.Response(models: data))
    }
    
}
