//
//  CartTableViewDelegate.swift
//  MishiPay
//
//  Created by ds-mayur on 02/01/2021.
//

import UIKit.UITableView


class CartTableViewDelegate : CartListData, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
}
