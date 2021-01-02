//
//  CartTableViewCell.swift
//  MishiPay
//
//  Created by ds-mayur on 02/01/2021.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productIV : UIImageView!
    @IBOutlet weak var productTitle : UILabel!
    @IBOutlet weak var productPrice : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    internal func setupCell(product data : Product){
        productIV.image = UIImage(named: data.image)
        productTitle.text = data.title
        productPrice.text = "$" + data.price.toString()
    }
}

//MARK:- Extension
extension CartTableViewCell : ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
