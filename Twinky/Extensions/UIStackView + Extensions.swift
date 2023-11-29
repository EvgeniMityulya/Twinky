//
//  UIStackView + Extensions.swift
//  Twinky
//
//  Created by Евгений Митюля on 11/29/23.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubview(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
