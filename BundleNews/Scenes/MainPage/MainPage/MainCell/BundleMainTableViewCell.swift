//
//  BundleMainTableViewCell.swift
//  BundleNews
//
//  Created by Enes Sakut on 18.02.2020.
//  Copyright © 2020 Enes Sakut. All rights reserved.
//

import UIKit
import SDWebImage

class BundleMainTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var ProductImage: UIImageView!
    
    @IBOutlet weak var ProductType: UILabel!
    
    @IBOutlet weak var ProductName: UILabel!
    
    @IBOutlet weak var ProductPrice: UILabel!
    
    @IBAction func GetButton(_ sender: Any) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(_ model: ProductDataModel) {
        ProductName.text = model.productInfo.name
        ProductType.text = model.productInfo.category
        ProductPrice.text = ((model.productInfo.price!) + "TL")
        ProductImage.sd_setImage(with: URL(string: model.productInfo.image!))

    }
    
}
