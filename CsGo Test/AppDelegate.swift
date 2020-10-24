//
//  AppDelegate.swift
//  CsGo Test
//
//  Created by Виталий on 9/13/20.
//  Copyright © 2020 Виталий. All rights reserved.
//

import UIKit
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)

        if Preferences.shared.isLogged {
            RoutingHelper.makeRoot(storyboard: .main)
        } else {
            RoutingHelper.makeRoot(storyboard: .search)
        }

        if let token = Preferences.shared.playerId {
            debugPrint("🟢 API_TOKEN: \(token)")
        }
        
        return true
    }
}

