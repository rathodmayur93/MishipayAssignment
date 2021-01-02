//
//  CartPresenter.swift
//  MishiPay
//
//  Created by ds-mayur on 02/01/2021.
//

import Foundation


protocol CartPresenterDelegate {
    func reloadTableView()
}


class CartPresenter {
    
    var cartListModel : [Product]?
    private weak var dataSource : CartListDataSource?
    private weak var delegate : CartTableViewDelegate?
    var cartPresenterDelegate : CartPresenterDelegate?
    var db : DBHelper
    
    //MARK:- Initlaizer
    init(tableViewDataSource : CartListDataSource, tableViewDelegate : CartTableViewDelegate, database : DBHelper = DBHelper()) {
        self.dataSource = tableViewDataSource
        self.delegate = tableViewDelegate
        db = database
    }
    
    //Passing the reference of the presenter to the dataSource, delegate & prefetchData
    private func passDataToDataSource(){
        dataSource?.cartPresenter = self
        delegate?.cartPresenter = self
    }
    
    internal func addDataInDB(){
        db.insert(id: 1, title: "Prouct 1", price: 100, image: "prodOne", barcode: "663650012040579520201225192309", isInCart: 0)
        db.insert(id: 2, title: "Prouct 2", price: 50, image: "prodTwo", barcode: "BAH20210101008950N209081", isInCart: 0)
        db.insert(id: 3, title: "Prouct 3", price: 150, image: "prodThree", barcode: "http://qr.w69b.com/g/taI8hMa1a", isInCart: 0)
        db.insert(id: 4, title: "Prouct 4", price: 100, image: "prodOne", barcode: "", isInCart: 0)
        db.insert(id: 5, title: "Prouct 5", price: 50, image: "prodTwo", barcode: "", isInCart: 0)
        db.insert(id: 6, title: "Prouct 6", price: 150, image: "prodThree", barcode: "", isInCart: 0)
    }
    
    internal func getAllProduct(){
        cartListModel = db.read()
        
        //Passing data to tableView
        passDataToDataSource()
    }
    
    internal func removeProductFromCart(barcodeValue : String, index : Int){
        db.removeProductFromCart(barcode: barcodeValue)
        cartListModel?.remove(at: index)
        cartPresenterDelegate?.reloadTableView()
    }
}
