//
//  ProductDetailViewController.swift
//  BundleNews
//
//  Created by Enes Sakut on 20.02.2020.
//  Copyright © 2020 Enes Sakut. All rights reserved.
//

import UIKit
import SDWebImage


protocol ProductDetailViewContoller {
//    var presenter: ProductDetailPresenter! { get set }
    var router: ProductDetailRouter! { get set }
    var interactor: ProductDetailInteractor! { get set }
    
    var config: ProductDetails.Config! { get set }
    
    func displayView(_ viewModel:  ProductDetails.InitUI.ViewModel)
    
    func showDetails(data: ProductDetails.Config)
   
}

class ProductDetailViewControllerImpl: UIViewController, ProductDetailViewContoller {
    
    
    @IBOutlet weak var image: UIImageView!
    
    
    @IBOutlet weak var hemenAl: RoundButton!
    @IBOutlet weak var ProductType: UILabel!
    
    @IBOutlet weak var ProductPrice: UILabel!
    @IBOutlet weak var ProductName: UILabel!
    @IBOutlet weak var sepeteEkle: UIButton!
    
    
//    var presenter: ProductDetailPresenter!
    var router: ProductDetailRouter!
    var interactor: ProductDetailInteractor!
    
    var config: ProductDetails.Config!
//    var data: ProductInfo
    var uiModel:  ProductDetails.InitUI.ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactor.presentView()
        self.interactor.getData(data: config)
        // Do any additional setup after loading the view.
    }
    
    func displayView(_ viewModel: ProductDetails.InitUI.ViewModel) {
        self.uiModel = viewModel
        setBundleDetailTitle(viewModel.title, color: viewModel.color)
    }
    
    func showDetails(data: ProductDetails.Config) {
        image.sd_setImage(with: URL(string: data.data.image!))
        ProductType.text = data.data.name
        ProductName.text = data.data.category
        ProductPrice.text = (data.data.price! + "TL")
    }
}
