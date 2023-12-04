//
//  ProfileBuilder.swift
//  Twinky
//
//  Created by Anton Polovoy on 4.12.23.
//

import Foundation

enum ProfileBuilder {
    static func setupModule() -> ProfileViewController {
        let viewController = ProfileViewController()
        viewController.output = ProfilePresenter(input: viewController)
        return viewController
    }
}
