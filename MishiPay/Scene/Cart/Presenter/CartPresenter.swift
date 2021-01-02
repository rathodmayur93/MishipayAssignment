//
//  CartPresenter.swift
//  MishiPay
//
//  Created by ds-mayur on 02/01/2021.
//

import Foundation


class CartPresenter {
    
    var cartListModel : [Product]?
    private weak var dataSource : CartListDataSource?
    private weak var delegate : CartTableViewDelegate?
    
    //MARK:- Initlaizer
    init(tableViewDataSource : CartListDataSource, tableViewDelegate : CartTableViewDelegate) {
        self.dataSource = tableViewDataSource
        self.delegate = tableViewDelegate
    }
    
    //Passing the reference of the presenter to the dataSource, delegate & prefetchData
    private func passDataToDataSource(){
        dataSource?.cartPresenter = self
        delegate?.cartPresenter = self
    }
}
