//
//  UserInfoView.swift
//  Twinky
//
//  Created by Евгений Митюля on 11/28/23.
//

import UIKit

class UserInfoView: UIView {
    private let backgroundView = UIView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    
    init(width: CGFloat, height: CGFloat, title: String, subtitle: String) {
        let frame = CGRect(x: 0, y: 0, width: width, height: height)
        super.init(frame: frame)
        configureConstraints()
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundView.addSubview(titleLabel)
        backgroundView.addSubview(subtitleLabel)
        
        titleLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor).isActive = true
        
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor).isActive = true
        
        backgroundColor = .green
    }
}
