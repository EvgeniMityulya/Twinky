//
//  ProfileBuilder.swift
//  Twinky
//
//  Created by Евгений Митюля on 12/3/23.
//

import Foundation

enum ProfileBuilder {
    static func setupProfile() -> ProfileViewController {
        let viewController = ProfileViewController()
        viewController.output = ProfilePresenter(input: viewController)
        return viewController
    }
}
