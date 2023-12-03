//
//  ProfilePresenter.swift
//  Twinky
//
//  Created by Евгений Митюля on 12/3/23.
//

import UIKit

protocol ProfileViewOutput {
    func viewDidLoad()
    func settingsButtonTapped()
    func filmCollectionPrevButtonTapped(index: inout Int)
    func filmCollectionNextButtonTapped(index: inout Int, items: Int)
}

final class ProfilePresenter: ProfileViewOutput {
    
    private unowned var input: ProfileViewInput
    
    init(input: ProfileViewInput) {
        self.input = input
    }
    
    func viewDidLoad() {
        input.configureNavigation(status: true)
        input.configureUserInfo()
        input.configureUI()
    }
    
    func settingsButtonTapped() {
        let viewController = InformationViewController()
        input.pushViewController(withViewController: viewController)
    }
    
    func filmCollectionPrevButtonTapped(index: inout Int) {
        let itemsPerPage = 3
        
        guard index - itemsPerPage >= 0 else {
            return
        }
        index -= itemsPerPage
        input.moveCollectionView(index: index)
    }
    
    func filmCollectionNextButtonTapped(index: inout Int, items: Int) {
        let itemsPerPage = 3
        
        guard index + itemsPerPage < items else {
            return
        }
        index += itemsPerPage
        input.moveCollectionView(index: index)
    }
}
