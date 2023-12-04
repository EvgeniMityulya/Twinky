//
//  GenreCell.swift
//  Twinky
//
//  Created by Anton Polovoy on 4.12.23.
//

import UIKit
import SnapKit

class GenreCell: UICollectionViewCell {
    static let identifier = "GenreCell"
    
    private lazy var genreLabel: UILabel = {
        let lbl = UILabel()
        
        lbl.font = .sourceSans(ofSize: 18, style: .bold)
        lbl.textColor = .titleColor
        
        lbl.minimumScaleFactor = 0.4
        lbl.adjustsFontSizeToFitWidth = true
        lbl.textAlignment = .center
        return lbl
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 30
        
        addSubview(genreLabel)
        
        genreLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(10)
            $0.left.equalToSuperview().offset(5)
            $0.right.equalToSuperview().offset(-5)
        }
    }
    
    func configure(withGenre genre: String) {
        genreLabel.text = genre
        self.backgroundColor = .systemGray4
    }
}
