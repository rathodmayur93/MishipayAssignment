//
//  Router.swift
//  MishiPay
//
//  Created by ds-mayur on 02/01/2021.
//

import UIKit.UIViewController

protocol Router {
    /**
        - This method will push the viewController on the NavigationController stack
        - Parameters:
        - Parameter sourceVC: This pararmter will define the source view controller or from where you want navigate
        - Parameter destinationVC: This pararmter will define the destinatino view controller or to where you want navigate
        - Parameter storyboard: We have to define a storyboarrd name where the destinatino view controller is present
        - Parameter presentatinoStyle: This will define how the destinationView controller presented.
        - Parameter transitionStyle: This will define how the transition from sourceVC to desstionationVC should happen
    */
    func pushViewController(from sourceVC : UIViewController,
                            to destinationVC : AllViewControllerEnum,
                            storyboard name : StoryboardAnXIBEnum,
                            presentatinoStyle : UIModalPresentationStyle?,
                            transitionStyle : UIModalTransitionStyle?)
    
    /**
        - This method will present the viewController by removing presented viewController
        - Parameters:
        - Parameter sourceVC: This pararmter will define the source view controller or from where you want navigate
        - Parameter destinationVC: This pararmter will define the destinatino view controller or to where you want navigate
        - Parameter storyboard: We have to define a storyboarrd name where the destinatino view controller is present
        - Parameter presentatinoStyle: This will define how the destinationView controller presented.
        - Parameter transitionStyle: This will define how the transition from sourceVC to desstionationVC should happen
    */
    func presentViewController(from sourceVC : UIViewController,
                               to destinationVC : AllViewControllerEnum,
                               storyboard name : StoryboardAnXIBEnum,
                               presentatinoStyle : UIModalPresentationStyle?,
                               transitionStyle : UIModalTransitionStyle?)
    
    /**
        - This method will remove the viewController from presented viewController
        - Parameters:
        - Parameter vc: This pararmter will define the  view controller you want to dismiss
    */
    func dismiss(from vc: UIViewController,
                 completion: (() -> Void)?)
}
