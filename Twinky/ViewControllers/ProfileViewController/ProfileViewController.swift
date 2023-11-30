//
//  ProfileViewController.swift
//  Twinky
//
//  Created by Евгений Митюля on 11/28/23.
//

import UIKit
import SnapKit

// MARK: - ProfileViewController

final class ProfileViewController: UIViewController {
    // MARK: - Outlets
    
    private lazy var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Brad Pitt"
        lbl.textColor = .titleColor
        lbl.font = .sourceSans(ofSize: 35, style: .black)
        return lbl
    }()
    
    private lazy var filmCollectionLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Brad's Film Collection"
        lbl.textColor = .titleColor
        lbl.font = .sourceSans(ofSize: 20, style: .semiBold)
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
    
    private lazy var filmCollectionPrevButton: UIButton = {
        let btn = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 14, weight: .black)
        let settingsImage = UIImage(systemName: "chevron.backward", withConfiguration: config)?.withTintColor(.iconColor, renderingMode: .alwaysOriginal)
        let settingsImageTapped = UIImage(systemName: "chevron.backward", withConfiguration: config)?.withTintColor(.iconTouched, renderingMode: .alwaysOriginal)
        
        btn.setImage(settingsImage, for: .normal)
        btn.setImage(settingsImageTapped, for: .highlighted)
        
        btn.addTarget(self, action: #selector(filmCollectionPrevButtonTouchUpInside), for: .touchUpInside)
        return btn
    }()
    
    private lazy var filmCollectionNextButton: UIButton = {
        let btn = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 14, weight: .black)
        let settingsImage = UIImage(systemName: "chevron.forward", withConfiguration: config)?.withTintColor(.iconColor, renderingMode: .alwaysOriginal)
        let settingsImageTapped = UIImage(systemName: "chevron.forward", withConfiguration: config)?.withTintColor(.iconTouched, renderingMode: .alwaysOriginal)
        
        btn.setImage(settingsImage, for: .normal)
        btn.setImage(settingsImageTapped, for: .highlighted)
        
        btn.addTarget(self, action: #selector(filmCollectionNextButtonTouchUpInside), for: .touchUpInside)
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
    
    private lazy var filmsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let clv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        clv.delegate = self
        clv.dataSource = self
        clv.backgroundColor = .clear
        return clv
    }()
    
    private var userFilmsView = UserInfoView()
    private var userContactsView = UserInfoView()
    private var userGenreView = UserInfoView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filmsCollectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCollectionViewCell")
        configureNavigation()
        configureViewColors()
        configureConstraints()
        configureButtons()
        configureUserInfo()
    }
    
    // MARK: - Private Methods
    
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
            userStackView,
            filmsCollectionView,
            filmCollectionLabel,
            filmCollectionPrevButton,
            filmCollectionNextButton
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
        
        filmsCollectionView.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(120)
        }
        
        filmCollectionNextButton.snp.makeConstraints { make in
            make.centerY.equalTo(filmCollectionLabel.snp.centerY)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        filmCollectionPrevButton.snp.makeConstraints { make in
            make.centerY.equalTo(filmCollectionLabel.snp.centerY)
            make.trailing.equalTo(filmCollectionNextButton.snp.leading).offset(-20)
        }
        
        filmCollectionLabel.snp.makeConstraints { make in
            make.bottom.equalTo(filmsCollectionView.snp.top).offset(-10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalTo(filmCollectionPrevButton.snp.leading).offset(-10)
        }
        
        
    }
    
    // MARK: - @objc Methods
    
    @objc private func settingsButtonTouchUpInside() {
        print("Go to settings button tapped")
    }
    
    @objc private func filmCollectionPrevButtonTouchUpInside() {
        print("Go to prev films")
    }
    
    @objc private func filmCollectionNextButtonTouchUpInside() {
        print("Go to next films")
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell else {
            fatalError("Unable to dequeue a cell")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 10
        let availableWidth = collectionView.bounds.width - 2 * spacing
        let cellWidth = availableWidth / 3
        return CGSize(width: cellWidth, height: collectionView.bounds.height)
    }
}
