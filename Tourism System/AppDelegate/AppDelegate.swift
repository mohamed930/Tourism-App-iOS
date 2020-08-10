//
//  AppDelegate.swift
//  Tourism System
//
//  Created by Mohamed Ali on 6/7/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit
import KYDrawerController
import Firebase
import IQKeyboardManagerSwift
import Stripe

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var drawerController = KYDrawerController.init(drawerDirection: .left, drawerWidth: 300)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
         Stripe.setDefaultPublishableKey("pk_test_51HEAo8Egh0JtMO8MiveSQC7KgonME76FyBiJCVtvLpuHlwVTvYwkgxY78zwnzRCMuzPwWJHCdLAvzaiijzeGLRg500zEvXvWhA")
        IQKeyboardManager.shared.enable = true
        FirebaseApp.configure()
        return true
    }

}

