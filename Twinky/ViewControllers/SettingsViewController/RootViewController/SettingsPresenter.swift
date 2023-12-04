//
//  SettingsPresenter.swift
//  Twinky
//
//  Created by Anton Polovoy on 30.11.23.
//

import UIKit

protocol SettingsViewOutput {
    func viewDidLoad() 
    func getPresentedViewController(forTag tag: Int, forIndex index: Int) -> UIViewController
    func signOut()
}

final class SettingsPresenter: SettingsViewOutput {
    private unowned var input: SettingsViewInput
    
    init(input: SettingsViewInput) {
        self.input = input
    }
    
    func viewDidLoad() {
        input.configureUI()
    }

    func getPresentedViewController(forTag tag: Int, forIndex index: Int) -> UIViewController {
        
        guard tag == 0 else {
            switch index {
            case 0:
                return LanguageViewController()
            case 1:
                return NotificationsViewController()
            case 2:
                return AppSettingsViewController()
            case 3:
                return HelpViewController()
            default:
                return UIViewController()
            }
        }
        
        return InformationViewController()
    }
    
    func signOut() {
        print("Signed Out!")
    }
}
