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
        let homeViewController = HomeViewController()
//        let favouriteViewController = FavouriteViewController()
//        let announcementViewController = AnnouncementViewController()
//        let dialogViewController = DialogViewController()
        let profileViewController = ProfileViewController()
        
        // MARK: - Navigation
        let navHomeViewController = UINavigationController(rootViewController: homeViewController)
//        let navFavouriteController = UINavigationController(rootViewController: favouriteViewController)
//        let navAnnouncementViewController = UINavigationController(rootViewController: announcementViewController)
//        let navDialogViewController = UINavigationController(rootViewController: dialogViewController)
        let navProfileViewController = UINavigationController(rootViewController: profileViewController)
        
        
        self.viewControllers = [
            navHomeViewController,
//                            navFavouriteController,
//                            navAnnouncementViewController,
//                            navDialogViewController,
                            navProfileViewController
                           ]
        
        
        // MARK: - Configure UI
        tabBar.backgroundColor = UIColor(named: "tabBarColor")
        tabBar.barTintColor = .white
        
        tabBar.items?[0].image = UIImage(systemName: "house.circle.fill")
        tabBar.items?[0].title = "Home"
//
        tabBar.items?[1].image = UIImage(systemName: "person.circle.fill")
        tabBar.items?[1].title = "Account"
//
//        tabBar.items?[2].image = UIImage(systemName: "plus.rectangle.fill.on.rectangle.fill")
//        tabBar.items?[2].title = "Объявления"
//        
//        tabBar.items?[3].image = UIImage(systemName: "ellipsis.message.fill")
//        tabBar.items?[3].title = "Диалоги"
//        
//        tabBar.items?[4].image = UIImage(systemName: "line.3.horizontal")
//        tabBar.items?[4].title = "Прочее"
    }
}

