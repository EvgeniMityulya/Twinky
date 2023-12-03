//
//  InformationViewController.swift
//  Twinky
//
//  Created by Anton Polovoy on 30.11.23.
//

import UIKit

class InformationViewController: UIViewController {

    private let label: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .backgroundViewSecondary
        lbl.text = "Profile Information"
        lbl.font = .sourceSans(ofSize: 33, style: .italic)
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.backgroundColor = .backgroundView
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

}
