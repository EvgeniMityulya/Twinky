//
//  HomeBuilder.swift
//  Twinky
//
//  Created by Anton Polovoy on 4.12.23.
//

import Foundation

enum HomeBuilder {
    static func setupModule() -> HomeViewController {
        let viewController = HomeViewController()
        viewController.output = HomePresenter(input: viewController)
        return viewController
    }
}
