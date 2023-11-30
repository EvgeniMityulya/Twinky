//
//  ProfileViewController.swift
//  Twinky
//
//  Created by Евгений Митюля on 11/28/23.
//

import UIKit
import SnapKit

final class ProfileViewController: UIViewController {
    private lazy var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Brad Pitt"
        lbl.textColor = .titleColor
        lbl.font = .sourceSans(ofSize: 35, style: .black)
        return lbl
    }()
    
    private lazy var settingsButton: UIButton = {
        let btn = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 35)
        let settingsImage = UIImage(systemName: "gearshape.circle.fill", withConfiguration: config)?.withTintColor(.iconColor, renderingMode: .alwaysOriginal)
        let settingsImageTapped = UIImage(systemName: "gearshape.circle.fill", withConfiguration: config)?.withTintColor(.iconTouched, renderingMode: .alwaysOriginal)
        
        btn.setImage(settingsImage, for: .normal)
        btn.setImage(settingsImageTapped, for: .highlighted)
        
        btn.addTarget(self, action: #selector(settingsButtonTouchUpInside), for: .touchUpInside)
        return btn
    }()
    
    private lazy var userImageView: UIImageView = {
        let imgv = UIImageView()
        imgv.clipsToBounds = true
        imgv.image = UIImage(named: "userProfileImage")
        imgv.contentMode = .scaleAspectFill
        imgv.layer.cornerRadius = 20
        return imgv
    }()
    
    private lazy var userStackView: UIStackView = {
        let stcv = UIStackView()
        stcv.axis = .vertical
        stcv.backgroundColor = .clear
        stcv.distribution = .fillEqually
        stcv.spacing = 10
        return stcv
    }()
    
    private var userFilmsView = UserInfoView()
    private var userContactsView = UserInfoView()
    private var userGenreView = UserInfoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        configureViewColors()
        configureConstraints()
        configureButtons()
        configureUserInfo()
    }
    
    private func configureNavigation() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func configureViewColors() {
        view.backgroundColor = .backgroundViewColor
    }
    
    private func configureUserInfo() {
        userFilmsView.configureView(title: "125", subtitle: "Films")
        userContactsView.configureView(title: "31", subtitle: "Contacts")
        userGenreView.configureView(title: "7", subtitle: "Genres")
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
        view.addSubview(
            nameLabel,
            settingsButton,
            userImageView,
            userStackView
        )
        
        userStackView.addArrangedSubview(
            userFilmsView,
            userContactsView,
            userGenreView
        )
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalTo(20)
            make.trailing.equalTo(settingsButton.snp.leading).offset(-10)
        }
        
        settingsButton.snp.makeConstraints { make in
            make.centerY.equalTo(nameLabel.snp.centerY)
            make.trailing.equalTo(-20)
        }
        
        userImageView.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(220)
            make.height.equalTo(250)
        }
        
        userStackView.snp.makeConstraints { make in
            make.top.equalTo(userImageView.snp.top)
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalTo(userImageView.snp.trailing).offset(10)
            make.bottom.equalTo(userImageView.snp.bottom)
        }
    }
    
    @objc private func settingsButtonTouchUpInside() {
        print("Go to settings button tapped")
    }
}
