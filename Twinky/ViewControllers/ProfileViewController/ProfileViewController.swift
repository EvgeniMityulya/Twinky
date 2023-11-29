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
    private let aboutView = UIView()
    private let userImageView = UIImageView()
    private let userStackView = UIStackView()
    private let userFavouriteFilmView = UserInfoView(width: 200, height: 100, title: "2131", subtitle: "asda")
    private let userContactsView = UserInfoView(width: 200, height: 100, title: "2131", subtitle: "asda")
    
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
        aboutView.backgroundColor = .red
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
        aboutView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(nameLabel)
        view.addSubview(settingsButton)
        view.addSubview(aboutView)
        view.addSubview(userImageView)
        view.addSubview(userStackView)
        
        userStackView.addArrangedSubview(userFavouriteFilmView)
        userStackView.addArrangedSubview(userContactsView)
        
        nameLabel.centerYAnchor.constraint(equalTo: settingsButton.centerYAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: settingsButton.leadingAnchor, constant: -20).isActive = true
        
        settingsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        settingsButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
//        settingsButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        settingsButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        aboutView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
        aboutView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        aboutView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        aboutView.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        userImageView.clipsToBounds = true
        userImageView.image = UIImage(named: "userPhoto")
        userImageView.contentMode = .scaleAspectFill
        userImageView.layer.cornerRadius = 20
        
        userImageView.topAnchor.constraint(equalTo: aboutView.topAnchor).isActive = true
        userImageView.leadingAnchor.constraint(equalTo: aboutView.leadingAnchor).isActive = true
        userImageView.bottomAnchor.constraint(equalTo: aboutView.bottomAnchor).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: 220).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        userStackView.topAnchor.constraint(equalTo: aboutView.topAnchor).isActive = true
        userStackView.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 10).isActive = true
        userStackView.trailingAnchor.constraint(equalTo: aboutView.trailingAnchor).isActive = true
        userStackView.bottomAnchor.constraint(equalTo: aboutView.bottomAnchor).isActive = true
        userStackView.axis = .vertical
        userStackView.backgroundColor = .blue
    }
    
    @objc private func settingsButtonTouchUpInside() {
        print("Go to settings button tapped")
    }
}
