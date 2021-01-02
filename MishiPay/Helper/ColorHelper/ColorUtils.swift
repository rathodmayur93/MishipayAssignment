//
//  ColorUtils.swift
//  MishiPay
//
//  Created by ds-mayur on 02/01/2021.
//

import UIKit.UIColor

// Struct-based singleton as there's no mutablity required here
struct ColorUtils : ColorUtilsProtocol {
    
    static let sharedInstance = ColorUtils()
    private init() {}
    
    
    /// This will retunr the primary buttons background color
    internal func getPrimaryButtonBackgroundColor() -> UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: ColorsEnum.buttonBackground.rawValue) ?? UIColor.gray
        } else {
            // Fallback on earlier versions
            return UIColor().hexStringToUIColor(color: ColorsEnum.buttonBackground)
        }
    }
    
    /// This will retunr the primary buttons text color
    internal func getPrimaryButtonTextColor() -> UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: ColorsEnum.buttonTextColor.rawValue) ?? UIColor.gray
        } else {
            // Fallback on earlier versions
            return UIColor().hexStringToUIColor(color: ColorsEnum.buttonTextColor)
        }
    }
    
  
    
    // Added while code review
    internal func getColor(color name : ColorsEnum) -> UIColor{
        if #available(iOS 11.0, *){
            return UIColor(named: name.rawValue) ?? UIColor.gray
        }else{
            return UIColor().hexStringToUIColor(color: name)
        }
    }
}
