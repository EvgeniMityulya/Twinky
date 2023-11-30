//
//  SettingsBuilder.swift
//  Twinky
//
//  Created by Anton Polovoy on 30.11.23.
//

import Foundation
import UIKit

enum SettingsBuilder {
    static func setupSettings() -> UIViewController {
        let viewController = SettingsViewController()
        viewController.output = SettingsPresenter(input: viewController)
        return viewController
    }
}
