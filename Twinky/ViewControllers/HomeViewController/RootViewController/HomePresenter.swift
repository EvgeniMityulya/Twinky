//
//  HomePresenter.swift
//  Twinky
//
//  Created by Anton Polovoy on 3.12.23.
//

import Foundation

protocol HomeViewOutput {
    func viewDidLoad()
    func listButtonTapped()
}

final class HomePresenter: HomeViewOutput {
    private unowned var input: HomeViewInput
    
    init(input: HomeViewInput) {
        self.input = input
    }
    
    func viewDidLoad() {
        input.configureUI()
    }
    
    func listButtonTapped() {
        print("Tap 1")
    }
}
