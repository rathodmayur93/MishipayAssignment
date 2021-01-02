//
//  AllViewControllerEnum.swift
//  MishiPay
//
//  Created by ds-mayur on 02/01/2021.
//

import Foundation

/// This Enum will contain all the viewControllers identifier names
enum AllViewControllerEnum : String {
    case scannerViewController = "ScannerViewController"
    case cartViewController = "ViewController"
    case invoiceViewController = "InvoiceViewController"
    
    //Added while code review
    /// This will return the navigation bar title of the respective viewController
    internal func getTitle() -> String{
        switch self {
        case .scannerViewController:
            return "Scanner"
        case .cartViewController:
            return "Cart"
        case .invoiceViewController:
            return "Invoice"
        }
    }
    
    internal func vcIdentifier() -> String {
        return self.rawValue
    }
}

/// This Enum containis all the storyboard names
enum StoryboardAnXIBEnum : String{
    case main = "Main"
}
