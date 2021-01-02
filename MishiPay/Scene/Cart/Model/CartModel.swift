//
//  CartModel.swift
//  MishiPay
//
//  Created by ds-mayur on 02/01/2021.
//

import Foundation


struct Product {
    var id    : Int!
    var title : String!
    var price : Int!
    var image : String!
    var barcode : String!
    var isInCart : Int!
}

extension Product {
    func getDefaultProduct() -> Product {
        return Product(id : 0, title: "No Product", price: 0, image: "Default", barcode: "", isInCart: 0)
    }
}
