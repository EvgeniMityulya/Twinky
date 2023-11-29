//
//  UIView + Extensions.swift
//  Twinky
//
//  Created by Евгений Митюля on 11/29/23.
//

import UIKit

extension UIView {
    func addSubview(_ views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
}
