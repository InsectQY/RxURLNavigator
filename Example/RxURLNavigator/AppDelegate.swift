//
//  AppDelegate.swift
//  RxURLNavigator
//
//  Created by 2562249572@qq.com on 11/04/2018.
//  Copyright (c) 2018 2562249572@qq.com. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
        initRootViewController()
        initRouter()
        return true
    }
}

extension AppDelegate {
    
    fileprivate func initRootViewController() {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        
        let homeVc = HomeViewController()
        window?.rootViewController = UINavigationController(rootViewController: homeVc)
    }
    
    fileprivate func initRouter() {
       NavigationMap.initRouter()
    }
}

