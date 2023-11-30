//
//  AppSettingsViewController.swift
//  Twinky
//
//  Created by Anton Polovoy on 30.11.23.
//

import UIKit

class AppSettingsViewController: UIViewController {

    private let label: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .backgroundViewSecondary
        lbl.text = "App Settings"
        lbl.font = .sourceSans(ofSize: 33, style: .italic)
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.backgroundColor = .backgroundView
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }

}
