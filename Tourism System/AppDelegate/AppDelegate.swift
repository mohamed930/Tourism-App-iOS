//
//  AppDelegate.swift
//  Tourism System
//
//  Created by Mohamed Ali on 6/7/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit
import Firebase
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        FirebaseApp.configure()
        return true
    }

}

