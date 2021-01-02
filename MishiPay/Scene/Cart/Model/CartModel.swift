//
//  CartModel.swift
//  MishiPay
//
//  Created by ds-mayur on 02/01/2021.
//

import Foundation


struct Product {
    var title : String!
    var price : Double!
    var image : String!
}

extension Product {
    func getDefaultProduct() -> Product {
        return Product(title: "No Product", price: 0.0, image: "Default")
    }
}
