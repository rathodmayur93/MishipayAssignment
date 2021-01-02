//
//  CartRouter.swift
//  MishiPay
//
//  Created by ds-mayur on 02/01/2021.
//

import UIKit

struct CartRouter {
    
    internal func navigateToScannerViewController(cartVC : ViewController){
        
        //Fetching the storyBoard and creating the MovieDetailViewController object
        let mainStoryboard         = UIStoryboard(name: StoryboardAnXIBEnum.main.rawValue,
                                                  bundle: Bundle.main)
        let vc : UIViewController  = mainStoryboard.instantiateViewController(withIdentifier: AllViewControllerEnum.scannerViewController.vcIdentifier()) as UIViewController
        
        //Presentation style
        vc.modalPresentationStyle   = .automatic
        
        //For Navigation Controller push the ViewController
        cartVC.navigationController?.pushViewController(vc, animated: true)
    }
    
    internal func navigateToInvoiceController(cartVC : ViewController, data : [Product]){
        //Fetching the storyBoard and creating the MovieDetailViewController object
        let mainStoryboard         = UIStoryboard(name: StoryboardAnXIBEnum.main.rawValue,
                                                  bundle: Bundle.main)
        let vc : InvoiceViewController  = mainStoryboard.instantiateViewController(withIdentifier: AllViewControllerEnum.invoiceViewController.vcIdentifier()) as! InvoiceViewController
        vc.productList = data
        //Presentation style
        vc.modalPresentationStyle   = .automatic
        
        //For Navigation Controller push the ViewController
        cartVC.navigationController?.pushViewController(vc, animated: true)
    }
    
}
