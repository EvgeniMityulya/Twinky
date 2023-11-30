//
//  ImageCollectionViewCell.swift
//  Twinky
//
//  Created by Евгений Митюля on 11/30/23.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    // MARK: - Outlets
    
    private lazy var imageView: UIImageView = {
        let imgv = UIImageView()
        imgv.clipsToBounds = true
        imgv.image = UIImage(named: "userProfileImage")
        imgv.contentMode = .scaleAspectFill
        imgv.layer.cornerRadius = 20
        return imgv
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    // MARK: - Public Methods
    
    func configure(with image: UIImage?) {
        imageView.image = image
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
