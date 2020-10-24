//
//  AppDelegate.swift
//  CsGo Test
//
//  Created by Виталий on 10/22/20.
//  Copyright © 2020 Виталий. All rights reserved.
//

import Foundation
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        AppContext.shared.config(application: application, window: window)
        
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)

        if Preferences.shared.isLogged {
            RoutingHelper.makeRoot(storyboard: .main)
        } else {
            RoutingHelper.makeRoot(storyboard: .start)
        }

        if let token = Preferences.shared.playerId {
            debugPrint("🟢 API_TOKEN: \(token)")
        }

        return true
    }
    
}
