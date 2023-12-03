//
//  SettingsBuilder.swift
//  Twinky
//
//  Created by Anton Polovoy on 30.11.23.
//

import Foundation

enum SettingsBuilder {
    static func setupSettings() -> SettingsViewController {
        let viewController = SettingsViewController()
        viewController.output = SettingsPresenter(input: viewController)
        return viewController
    }
}
