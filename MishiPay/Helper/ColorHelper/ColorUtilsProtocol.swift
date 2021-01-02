//
//  ColorUtilsProtocol.swift
//  MishiPay
//
//  Created by ds-mayur on 02/01/2021.
//

import UIKit.UIColor

protocol ColorUtilsProtocol {
    /**
        - This function will return the viewController background view color
     */
    func getViewControllerBackgroundColor() -> UIColor
    /**
        - This function will return the primary buttons border color
     */
    func getPrimaryButtonBorderColor() -> UIColor
    
    /**
        - This function will return the primary buttons background color
     */
    func getPrimaryButtonBackgroundColor() -> UIColor
    /**
        - This function will return the primary text color
     */
    func getTextColor() -> UIColor
    
    /**
        - This function will return the primary  color of the app
     */
    func getPrimaryColor() -> UIColor
    /**
        - In this function you have to pass the ColorEnum value and it will return the UIColor
        - Parameters:
        - Parameter name: This pararmter will define the ColorEnum value
     */
    func getColor(color name : ColorsEnum) -> UIColor
    
}
