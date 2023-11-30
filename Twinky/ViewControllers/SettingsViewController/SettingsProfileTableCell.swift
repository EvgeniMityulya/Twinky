//
//  ProfileTableCell.swift
//  Twinky
//
//  Created by Anton Polovoy on 29.11.23.
//

import UIKit

class SettingsProfileTableCell: UITableViewCell {

    static let identifier = "ProfileCell"
    
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.sourceSans(ofSize: 20, style: .bold)
        lbl.textColor = .titleColor
        return lbl
    }()
    
    private let userImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.layer.cornerRadius = 35
        return img
    }()
    
    private let subtitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.sourceSans(ofSize: 16, style: .regular)
        lbl.textColor = .titleColor
        return lbl
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(userImage)
        
        userImage.snp.makeConstraints {
            $0.left.equalTo(20)
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(70)
        }
        
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(userImage.snp.right).offset(20)
            $0.top.equalTo(20)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.left.equalTo(userImage.snp.right).offset(20)
            $0.top.equalTo(titleLabel.snp.bottom)
        }
    }

    func configure(withContent content: ProfileSettingsCellContent) {
        titleLabel.text = content.title
        subtitleLabel.text = content.subtitle
        userImage.image = content.image
    }
}
