//
//  SettingsViewController.swift
//  Twinky
//
//  Created by Admin on 29.11.23.
//

import Foundation
import UIKit
import SnapKit
class SettingsViewController: UIViewController {
    
    private lazy var label: UILabel = {
        let lbl = UILabel()
        lbl.text = "hdifhdi"
        lbl.textColor = .titleColor
        lbl.font = .sourceSans(ofSize: 25, style: .blackItalic)
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.backgroundColor = .backgroundViewColor
        
        label.snp.makeConstraints {
            $0.center.equalTo(view.center)
        }
    }
}
