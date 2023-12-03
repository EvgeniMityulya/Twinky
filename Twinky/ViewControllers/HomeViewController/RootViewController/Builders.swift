//
//  Builders.swift
//  Twinky
//
//  Created by Anton Polovoy on 3.12.23.
//

import Foundation

enum Builders {
    static func setupProfile() -> ProfileViewController {
        let viewController = ProfileViewController()
        viewController.output = ProfilePresenter(input: viewController)
        return viewController
    }
    
    static func setupSettings() -> SettingsViewController {
        let viewController = SettingsViewController()
        viewController.output = SettingsPresenter(input: viewController)
        return viewController
    }
    
    static func setupHome() -> HomeViewController {
        let viewController = HomeViewController()
        viewController.output = HomePresenter(input: viewController)
        return viewController
    }
}
