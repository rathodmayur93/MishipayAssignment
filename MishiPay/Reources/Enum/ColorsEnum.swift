//
//  ColorsEnum.swift
//  MishiPay
//
//  Created by ds-mayur on 02/01/2021.
//


/// This enum will contaiin all the colors we are going to use withing an app
enum ColorsEnum : String{
    case buttonBackground = "buttonBackground"
    case buttonTextColor = "buttonText"
    
    /// This function will return a hex color code for those devices who doesn't support dark mode
    public func hexColorCode() -> String{
        switch self {
        case .buttonBackground:
            return "#FF9500"
        case .buttonTextColor:
            return "#FFFFFF"
        }
    }
}
