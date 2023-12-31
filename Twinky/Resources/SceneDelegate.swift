//
//  SceneDelegate.swift
//  Twinky
//
//  Created by Евгений Митюля on 11/28/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: windowScene)
        
        let tabBarController = TabBarController()
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
    }
}

