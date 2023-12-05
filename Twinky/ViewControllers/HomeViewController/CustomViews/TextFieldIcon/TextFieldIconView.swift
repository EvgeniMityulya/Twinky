//
//  TextFieldIconView.swift
//  Twinky
//
//  Created by Anton Polovoy on 5.12.23.
//

import UIKit

enum TextFieldIconView {
    
    static func create(size: CGFloat, image: String, color: UIColor, contentMode: UIView.ContentMode) -> UIView {
        let container = UIView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        
        let icon = UIImageView(image: UIImage(systemName: image))
        icon.frame = container.bounds
        icon.tintColor = color
        icon.contentMode = contentMode
        icon.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)

        container.addSubview(icon)
        return container
    }
}
