//
//  UIFont + Extensions.swift
//  Twinky
//
//  Created by Евгений Митюля on 11/28/23.
//

import UIKit.UIFont

enum FontStyle: String {
    case black           = "SourceSans3-Black"
    case blackItalic     = "SourceSans3-BlackItalic"
    case bold            = "SourceSans3-Bold"
    case boldItalic      = "SourceSans3-BoldItalic"
    case extraBold       = "SourceSans3-ExtraBold"
    case extraBoldItalic = "SourceSans3-ExtraBoldItalic"
    case extraLight      = "SourceSans3-ExtraLightItalic"
    case italic          = "SourceSans3-Italic"
    case light           = "SourceSans3-Light"
    case lightItalic     = "SourceSans3-LightItalic"
    case medium          = "SourceSans3-Medium"
    case mediumItalic    = "SourceSans3-MediumItalic"
    case regular         = "SourceSans3-Regular"
    case semiBold        = "SourceSans3-SemiBold"
    case semiBoldItalic  = "SourceSans3-semiBoldItalic"
}

extension UIFont {
    static func sourceSans(ofSize size: CGFloat, style: FontStyle) -> UIFont {
        return UIFont(name: style.rawValue, size: size) ?? .systemFont(ofSize: size)
    }
}
