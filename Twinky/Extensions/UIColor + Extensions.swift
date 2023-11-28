//
//  UIColor + Extensions.swift
//  Twinky
//
//  Created by Евгений Митюля on 11/28/23.
//

import UIKit.UIColor

extension UIColor {
    static var backgroundViewColor: UIColor {
        return UIColor(named: "backgroundView") ?? .black
    }
    
    static var titleColor: UIColor {
        return UIColor(named: "title") ?? .black
    }
    
    static var iconColor: UIColor {
        return UIColor(named: "icon") ?? .black
    }
    
    static var iconTouchedColor: UIColor {
        return UIColor(named: "iconTouched") ?? .black
    }
}
