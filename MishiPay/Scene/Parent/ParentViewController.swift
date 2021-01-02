//
//  ParentViewController.swift
//  MishiPay
//
//  Created by ds-mayur on 02/01/2021.
//

import UIKit.UIViewController

class ParentViewController : UIViewController {
    
    //MARK:- Variables & Properties
    internal var extraInfoFromPreviousVC : [String : Any]?
    
    //MARK:- UI Functions
    
    /**
        - This method wlll set backgroud color of the view
        - Parameters:
        - Parameter color: This pararmter will define the background view color
     */
    internal func setBackgroundViewColor(color : ColorsEnum = .backgroundColor){
        view.backgroundColor = ColorUtils.sharedInstance.getViewControllerBackgroundColor()
    }
    
    /**
        - This method wlll set navigation bar title
        - Parameters:
        - Parameter navigationTitle: This pararmter will define the navigation bar title
     */
    internal func setNavigationBarTitle(navigationTitle navTitle : String){
        title = navTitle
    }
    
    /**
        - This method wlll  hide the navigation bar title
     */
    internal func hideNavigationBarTitle(){
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    /**
        - This method wlll  show the navigation bar title
     */
    internal func showNavigationBarTitle(){
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
