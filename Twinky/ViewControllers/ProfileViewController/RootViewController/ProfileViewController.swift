//
//  ProfileViewController.swift
//  Twinky
//
//  Created by Евгений Митюля on 11/28/23.
//

import UIKit
import SnapKit

protocol ProfileViewInput: AnyObject {
    func configureUI()
    func configureNavigation(status: Bool)
    func configureUserInfo()
    func moveCollectionView(index: Int)
    func pushViewController(withViewController viewController: UIViewController)
    func presentViewController(withViewController viewController: UIViewController)
}

// MARK: - ProfileViewController

final class ProfileViewController: UIViewController {
    var output: ProfileViewOutput?
    
    // MARK: - Constants
    
    private var currentIndex = 0
    private let itemsCount = 7
    
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
    
    private lazy var mainContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var settingsButton: UIButton = {
        let btn = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 35)
        let settingsImage = UIImage(systemName: Icons.gearshapeFill, withConfiguration: config)?.withTintColor(.iconColor, renderingMode: .alwaysOriginal)
        let settingsImageTapped = UIImage(systemName: Icons.gearshapeFill, withConfiguration: config)?.withTintColor(.iconTouched, renderingMode: .alwaysOriginal)
        
        btn.setImage(settingsImage, for: .normal)
        btn.setImage(settingsImageTapped, for: .highlighted)
        
        btn.addTarget(self, action: #selector(settingsButtonTouchUpInside), for: .touchUpInside)
        return btn
    }()
    
    private lazy var filmCollectionPrevButton: UIButton = {
        let btn = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 14, weight: .black)
        let backwardArrowImage = UIImage(systemName: Icons.chevronBackward, withConfiguration: config)?.withTintColor(.iconColor, renderingMode: .alwaysOriginal)
        let backwardArrowImageTapped = UIImage(systemName: Icons.chevronBackward, withConfiguration: config)?.withTintColor(.iconTouched, renderingMode: .alwaysOriginal)
        
        btn.setImage(backwardArrowImage, for: .normal)
        btn.setImage(backwardArrowImageTapped, for: .highlighted)
        
        btn.addTarget(self, action: #selector(filmCollectionPrevButtonTouchUpInside), for: .touchUpInside)
        return btn
    }()
    
    private lazy var filmCollectionNextButton: UIButton = {
        let btn = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 14, weight: .black)
        let forwardArrowImage = UIImage(systemName: Icons.chevronForward, withConfiguration: config)?.withTintColor(.iconColor, renderingMode: .alwaysOriginal)
        let forwardArrowImageTapped = UIImage(systemName: Icons.chevronForward, withConfiguration: config)?.withTintColor(.iconTouched, renderingMode: .alwaysOriginal)
        
        btn.setImage(forwardArrowImage, for: .normal)
        btn.setImage(forwardArrowImageTapped, for: .highlighted)
        
        btn.addTarget(self, action: #selector(filmCollectionNextButtonTouchUpInside), for: .touchUpInside)
        return btn
    }()
    
    private lazy var userImageView: UIImageView = {
        let imgv = UIImageView()
        imgv.clipsToBounds = true
        imgv.image = UIImage(named: Icons.user)
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
        clv.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCollectionViewCell")
        clv.delegate = self
        clv.dataSource = self
        clv.backgroundColor = .clear
        clv.isPagingEnabled = true
        return clv
    }()
    
    private var userFilmsView = UserInfoView()
    private var userContactsView = UserInfoView()
    private var userGenreView = UserInfoView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }
    
    // MARK: - @objc Methods
    
    @objc private func settingsButtonTouchUpInside() {
        output?.settingsButtonTapped()
        
    }
    
    @objc private func filmCollectionPrevButtonTouchUpInside() {
        output?.filmCollectionPrevButtonTapped(index: &currentIndex)
    }
    
    @objc private func filmCollectionNextButtonTouchUpInside() {
        output?.filmCollectionNextButtonTapped(index: &currentIndex, items: itemsCount)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        itemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell else {
            fatalError("Unable to dequeue a cell")
        }
        cell.setText(with: "\(indexPath.row)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 10
        let availableWidth = collectionView.bounds.width - 2 * spacing
        let cellWidth = availableWidth / 3
        return CGSize(width: cellWidth, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return (currentIndex == 1) ? 100 : 0
    }
}

// MARK: - ProfileViewInput

extension ProfileViewController: ProfileViewInput {
    func presentViewController(withViewController viewController: UIViewController) {
        self.navigationController?.present(viewController, animated: true)
    }
    
    func pushViewController(withViewController viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func moveCollectionView(index: Int) {
        let prevIndexPath = IndexPath(item: index, section: 0)
        if let attributes = filmsCollectionView.layoutAttributesForItem(at: prevIndexPath) {
            let cellRect = attributes.frame
            let offsetPoint = CGPoint(x: cellRect.origin.x, y: cellRect.origin.y)
            filmsCollectionView.setContentOffset(offsetPoint, animated: true)
        }
    }
    
    func configureNavigation(status: Bool) {
        navigationController?.setNavigationBarHidden(status, animated: false)
    }
    
    func configureUserInfo() {
        userFilmsView.configureView(title: "125", subtitle: "Films")
        userContactsView.configureView(title: "31", subtitle: "Contacts")
        userGenreView.configureView(title: "7", subtitle: "Genres")
    }
    
    func configureUI() {
        view.backgroundColor = .backgroundViewColor
        
        view.addSubview(
            nameLabel,
            settingsButton,
            userImageView,
            userStackView,
            mainContentView,
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
            make.top.equalTo(60)
            make.leading.equalTo(20)
            make.trailing.equalTo(settingsButton.snp.leading).offset(-10)
        }
        
        settingsButton.snp.makeConstraints { make in
            make.centerY.equalTo(nameLabel.snp.centerY)
            make.trailing.equalTo(-20)
        }
        
        mainContentView.snp.makeConstraints { make in
            make.top.equalTo(userImageView.snp.bottom).offset(10)
            make.bottom.equalTo(filmCollectionLabel.snp.top).offset(-10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
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
    
}
