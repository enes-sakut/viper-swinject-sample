//
//  BundleMainTableViewController.swift
//  BundleNews
//
//  Created by Enes Sakut on 15.02.2020.
//  Copyright © 2020 Enes Sakut. All rights reserved.
//

import UIKit

protocol BundleMainTableViewController: class {
    
    var interactor: BundleMainInteractor! { get set }
    var bundle: Bundle! { get set }
    var router: BundleMainRouter! { get set }
    
    func displayData(_ viewModel: [ProductData.Data.ViewModel])
    
}

class BundleMainTableViewControllerImpl: UITableViewController , BundleMainTableViewController {
    
    var alertService: AlertService!
    
    private let cellReuseIdentifier = "BundleMainTableViewCell"
    private let loadingCellReuseIdentifier = "MainLoadingTableViewCell"
    
    private var cellHeight: CGFloat = 450
    private let loadingCellHeight: CGFloat = 80
    
    var interactor: BundleMainInteractor!
    
    var bundle: Bundle!
    var router: BundleMainRouter!
    var data: [ProductData.Data.ViewModel] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: cellReuseIdentifier, bundle: self.bundle)
        self.tableView.register(cellNib, forCellReuseIdentifier: cellReuseIdentifier)
        let loadingCellNib = UINib(nibName: loadingCellReuseIdentifier, bundle: self.bundle)
        self.tableView.register(loadingCellNib, forCellReuseIdentifier: loadingCellReuseIdentifier)
        
        self.interactor.loadData()
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == self.data.count && self.interactor.shouldShowLoadingMoreDataMessage() {
            return loadingCellHeight
        }

        else{
            cellHeight = 200
            return cellHeight
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //  return 100
        let realCount = self.data.count
        if self.interactor.shouldShowLoadingMoreDataMessage() {
            return realCount + 1 // Also count the "loading data" cell at the bottom
        }
        return realCount + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == self.data.count {
            return loadingCellAt(indexPath)
        }
        else {
            return cellAt(indexPath)
        }
    }
    
    func loadingCellAt(_ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: loadingCellReuseIdentifier, for: indexPath) as! MainLoadingTableViewCell
        cell.isHidden = !self.interactor.shouldShowLoadingMoreDataMessage()
        
        return cell
    }
    
    func cellAt(_ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? BundleMainTableViewCell else { return MainLoadingTableViewCell() }
        let model = self.data[indexPath.row]
        cell.updateUI(model.model)
        return cell
    }
    
    func displayData(_ viewModel: [ProductData.Data.ViewModel]) {
        self.data = viewModel
        viewModel.enumerated().forEach { item in
            let (index, _) = item
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let pData = (data[indexPath.row].model.productInfo)
        self.router.navigateToDetails(pData: pData, from: self)
       }
}
