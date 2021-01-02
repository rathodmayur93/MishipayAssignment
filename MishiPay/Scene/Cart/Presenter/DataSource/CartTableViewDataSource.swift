//
//  CartTableViewDataSource.swift
//  MishiPay
//
//  Created by ds-mayur on 02/01/2021.
//

import UIKit.UITableView


class CartListData : NSObject{
    weak var cartPresenter : CartPresenter?
}

class CartListDataSource : CartListData, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartPresenter?.cartListModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier) as? CartTableViewCell
        else { return UITableViewCell() }
        cell.setupCell(product: cartPresenter?.cartListModel?[indexPath.row] ?? Product().getDefaultProduct())
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            cartPresenter?.removeProductFromCart(barcodeValue: cartPresenter?.cartListModel?[indexPath.row].barcode ?? "-1", index: indexPath.row)
        }
    }
}
