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
    
    func getViewControllerBackgroundColor() -> UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: ColorsEnum.backgroundColor.rawValue) ?? UIColor.gray
        } else {
            // Fallback on earlier versions
            return UIColor().hexStringToUIColor(color: ColorsEnum.backgroundColor)
        }
    }
    
    func getPrimaryButtonBorderColor() -> UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: ColorsEnum.textColor.rawValue) ?? UIColor.gray
        } else {
            // Fallback on earlier versions
            return UIColor().hexStringToUIColor(color: ColorsEnum.textColor)
        }
    }
    
    /// This will retunr the primary buttons background color
    internal func getPrimaryButtonBackgroundColor() -> UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: ColorsEnum.primary.rawValue) ?? UIColor.gray
        } else {
            // Fallback on earlier versions
            return UIColor().hexStringToUIColor(color: ColorsEnum.primary)
        }
    }
    
    internal func getTextColor() -> UIColor{
        if #available(iOS 11.0, *) {
            return UIColor(named: ColorsEnum.textColor.rawValue) ?? UIColor.gray
        } else {
            // Fallback on earlier versions
            return UIColor().hexStringToUIColor(color: ColorsEnum.textColor)
        }
    }
    
    internal func getBackgrounColor() -> UIColor{
        if #available(iOS 11.0, *) {
            return UIColor(named: ColorsEnum.backgroundColor.rawValue) ?? UIColor.gray
        } else {
            // Fallback on earlier versions
            return UIColor().hexStringToUIColor(color: ColorsEnum.backgroundColor)
        }
    }
    
    internal func getPrimaryColor() -> UIColor{
        if #available(iOS 11.0, *) {
            return UIColor(named: ColorsEnum.primary.rawValue) ?? UIColor.gray
        } else {
            // Fallback on earlier versions
            return UIColor().hexStringToUIColor(color: ColorsEnum.primary)
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
