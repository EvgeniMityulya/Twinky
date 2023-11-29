//
//  SettingsTableCell.swift
//  Twinky
//
//  Created by Anton Polovoy on 29.11.23.
//

import UIKit
import SnapKit

class SettingsTableCell: UITableViewCell {

    static let identifier = "SettingsCell"
    
    private let settingsOptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.sourceSans(ofSize: 20, style: .bold)
        lbl.textColor = .titleColor
        return lbl
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(settingsOptionLabel)
        settingsOptionLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(30)
        }
    }
    
    func configure(withContent content: String) {
        settingsOptionLabel.text = content
    }
}
