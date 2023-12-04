//
//  SettingsBuilder.swift
//  Twinky
//
//  Created by Anton Polovoy on 4.12.23.
//

import Foundation

enum SettingsBuilder {
    static func setupModule() -> SettingsViewController {
        let viewController = SettingsViewController()
        viewController.output = SettingsPresenter(input: viewController)
        return viewController
    }
}
