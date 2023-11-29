//
//  UserInfoView.swift
//  Twinky
//
//  Created by Евгений Митюля on 11/28/23.
//

import UIKit
import SnapKit

class UserInfoView: UIView {
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .cellColor
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stcv = UIStackView()
        stcv.axis = .vertical
        stcv.distribution = .fillEqually
        return stcv
    }()
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .titleColor
        lbl.font = .sourceSans(ofSize: 20, style: .black)
        lbl.textAlignment = .center
        return lbl
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 1
        lbl.textColor = .titleColor
        lbl.textAlignment = .center
        lbl.font = .sourceSans(ofSize: 16, style: .semiBold)
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureConstraints()
    }
    
    func configureView(title: String, subtitle: String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
    
    private func configureConstraints() {
        addSubview(backgroundView)
        backgroundView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(backgroundView).inset(UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
        }
        
//        titleLabel.snp.makeConstraints { make in
//            make.top.equalTo(10)
//        }
    }
}
