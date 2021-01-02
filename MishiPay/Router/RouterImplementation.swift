//
//  RouterImplementation.swift
//  MishiPay
//
//  Created by ds-mayur on 02/01/2021.
//

import UIKit.UIViewController

class RouterImplementation : Router {

    
    func pushViewController(from sourceVC: UIViewController,
                            to destinationVC: AllViewControllerEnum,
                            storyboard name: StoryboardAnXIBEnum,
                            presentatinoStyle: UIModalPresentationStyle?,
                            transitionStyle: UIModalTransitionStyle?)
    {
        
        //Fetching the storyBoard and creating the MovieDetailViewController object
        let mainStoryboard         = UIStoryboard(name: name.rawValue,
                                                  bundle: Bundle.main)
        let vc : UIViewController  = mainStoryboard.instantiateViewController(withIdentifier: destinationVC.vcIdentifier()) as UIViewController
        
        //Presentation style
        vc.modalPresentationStyle   = presentatinoStyle ?? .fullScreen
        vc.modalTransitionStyle     = transitionStyle ?? .crossDissolve
        
        //For Navigation Controller push the ViewController
        sourceVC.navigationController?.pushViewController(vc, animated: true)
    }
    
    func presentViewController(from sourceVC: UIViewController,
                               to destinationVC: AllViewControllerEnum,
                               storyboard name: StoryboardAnXIBEnum,
                               presentatinoStyle: UIModalPresentationStyle?,
                               transitionStyle: UIModalTransitionStyle?)
    {
        //Fetching the storyBoard and creating the MovieDetailViewController object
        let mainStoryboard         = UIStoryboard(name: name.rawValue,
                                                  bundle: Bundle.main)
        let vc : UIViewController  = mainStoryboard.instantiateViewController(withIdentifier: destinationVC.vcIdentifier()) as UIViewController
        
        //Presentation style
        vc.modalPresentationStyle   = presentatinoStyle ?? .fullScreen
        vc.modalTransitionStyle     = transitionStyle ?? .crossDissolve
        
        //For Navigation Controller push the ViewController
        sourceVC.present(vc, animated: true, completion: nil)
    }
    
    func dismiss(from vc: UIViewController, completion: (() -> Void)?) {
        vc.dismiss(animated: true, completion: completion)
    }
    
    
}
