//
//  ProfileViewController.swift
//  Twinky
//
//  Created by Евгений Митюля on 11/28/23.
//

import UIKit

final class ProfileViewController: UIViewController {
    private let nameLabel = UILabel()
    private let settingsButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        configureViewColors()
        configureConstraints()
        configureLabels()
        configureButtons()
        
    }
    
    
    private func configureViewColors() {
        view.backgroundColor = .backgroundViewColor
    }
    
    private func configureLabels() {
        nameLabel.text = "John Doe"
        nameLabel.textColor = .titleColor
        nameLabel.font = UIFont.sourceSans(ofSize: 32, style: .black)
    }
    
    private func configureButtons() {
        let config = UIImage.SymbolConfiguration(pointSize: 35)
        let settingsImage = UIImage(systemName: "gearshape.circle.fill", withConfiguration: config)?.withTintColor(.iconColor, renderingMode: .alwaysOriginal)
        let settingsImageTapped = UIImage(systemName: "gearshape.circle.fill", withConfiguration: config)?.withTintColor(.iconTouched, renderingMode: .alwaysOriginal)
        
        settingsButton.setImage(settingsImage, for: .normal)
        settingsButton.setImage(settingsImageTapped, for: .highlighted)
        
        settingsButton.addTarget(self, action: #selector(settingsButtonTouchUpInside), for: .touchUpInside)
    }
    
    private func configureConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(nameLabel)
        view.addSubview(settingsButton)
        
        nameLabel.centerYAnchor.constraint(equalTo: settingsButton.centerYAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: settingsButton.leadingAnchor, constant: -20).isActive = true
        
        settingsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        settingsButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
//        settingsButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        settingsButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @objc private func settingsButtonTouchUpInside() {
        print("Go to settings button tapped")
    }
}
