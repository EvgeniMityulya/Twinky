//
//  ProfileViewController.swift
//  Twinky
//
//  Created by Евгений Митюля on 11/28/23.
//

import UIKit

final class ProfileViewController: UIViewController {
    private let nameLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewColors()
        configureLabels()
        configureConstraints()
    }

    
    private func configureViewColors() {
        view.backgroundColor = .backgroundViewColor
    }

    private func configureLabels() {
        nameLabel.text = "John Doe"
        nameLabel.textColor = .titleColor
        nameLabel.font = UIFont.sourceSans(ofSize: 32, style: .black)
    }
    
    private func configureConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(nameLabel)
        
        nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
}
