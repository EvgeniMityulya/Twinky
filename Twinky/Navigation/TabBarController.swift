//
//  TabBarController.swift
//  Twinky
//
//  Created by Евгений Митюля on 11/28/23.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        // MARK: - View Controllers
        let homeViewController = Builders.setupHome()
        let settingsViewController = Builders.setupSettings()
        let profileViewController = Builders.setupProfile()
        
        // MARK: - Navigation
        let navHomeViewController = UINavigationController(rootViewController: homeViewController)
        let navSettingsViewController = UINavigationController(rootViewController: settingsViewController)
        let navProfileViewController = UINavigationController(rootViewController: profileViewController)
        
        
        self.viewControllers = [
            navHomeViewController,
            navProfileViewController,
            navSettingsViewController
        ]
        
        
        // MARK: - Configure UI
        tabBar.backgroundColor = UIColor(named: "tabBarColor")
        tabBar.barTintColor = .white
        
        tabBar.items?[0].image = UIImage(systemName: Icons.houseFill)
        tabBar.items?[0].title = "Home"
        //
        tabBar.items?[1].image = UIImage(systemName: Icons.personFill)
        tabBar.items?[1].title = "Account"
        //
        tabBar.items?[2].image = UIImage(systemName: Icons.gearshapeFill)
        tabBar.items?[2].title = "Settings"
    }
}

