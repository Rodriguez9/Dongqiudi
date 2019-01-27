//
//  AppDelegate.swift
//  Dongqiu
//
//  Created by YZH on 2019/1/18.
//  Copyright © 2019年 YZH. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let tab = TabBarViewController()
        self.window?.rootViewController = tab
        self.window?.makeKeyAndVisible()
        return true
    }
}

