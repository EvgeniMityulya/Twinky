//
//  UIFont + Extensions.swift
//  Twinky
//
//  Created by Евгений Митюля on 11/28/23.
//

import UIKit.UIFont

enum FontStyle: String {
    case black = "SourceSans3-Black"
    case bold = "Manrope-Bold"
    case light = "Manrope-Light"
    case medium = "Manrope-Medium"
    case regular = "Manrope-Regular"
}

extension UIFont {
    static func sourceSans(ofSize size: CGFloat, style: FontStyle) -> UIFont {
        return UIFont(name: style.rawValue, size: size) ?? .systemFont(ofSize: size)
    }
}
