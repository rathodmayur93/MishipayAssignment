//
//  ColorsEnum.swift
//  MishiPay
//
//  Created by ds-mayur on 02/01/2021.
//


/// This enum will contaiin all the colors we are going to use withing an app
enum ColorsEnum : String{
    case backgroundColor = "background"
    case primary = "primary"
    case secondary = "secondary"
    case textColor = "textColor"
    
    /// This function will return a hex color code for those devices who doesn't support dark mode
    public func hexColorCode() -> String{
        switch self {
        case .backgroundColor:
            return "#F5F5F5"
        case .primary:
            return "#0288D1"
        case .secondary:
            return "5EB8FF"
        case .textColor:
            return "#424242"
        }
    }
}
