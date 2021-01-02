//
//  ParentViewController.swift
//  MishiPay
//
//  Created by ds-mayur on 02/01/2021.
//

import UIKit.UIViewController

class ParentViewController : UIViewController {
    
    enum Constants {
        //Dialog box Button text
        static let alertPositiveBTText = "Okay"
    }
    
    //MARK:- Variables & Properties
    internal var extraInfoFromPreviousVC : [String : Any]?
    
    //MARK:- UI Functions
    
    /**
        - This method wlll set backgroud color of the view
        - Parameters:
        - Parameter color: This pararmter will define the background view color
     */
//    internal func setBackgroundViewColor(color : ColorsEnum = .backgroundColor){
//        view.backgroundColor = ColorUtils.sharedInstance.getViewControllerBackgroundColor()
//    }
    
    /// Show alert dialog with title & message
    func showAlert(title: String, message: String, fromController controller: UIViewController){
        let alertController = UIAlertController(title: title,
                                                message:message,
                                                preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: Constants.alertPositiveBTText, style: UIAlertAction.Style.default,handler: nil))
        controller.present(alertController, animated: true, completion: nil)
    }
}
