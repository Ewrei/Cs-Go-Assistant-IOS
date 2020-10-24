//
//  AppContext.swift
//  CsGo Test
//
//  Created by Виталий on 10/22/20.
//  Copyright © 2020 Виталий. All rights reserved.
//

import Foundation
import UIKit
//import FirebaseMessaging
//import FirebaseAnalytics
//import FirebaseCrashlytics
//import YandexMobileMetrica
//import FBSDKCoreKit

final class AppContext: NSObject {
    static let shared = AppContext()
    
    private override init() {
        super.init()
    }
    
    private(set) var application: UIApplication!
    private(set) var window: UIWindow?
    
    func config(application: UIApplication, window: UIWindow?) {
        self.application = application
        self.window = window
//        window?.tintColor = Styling.tintColor
//
//        FirebaseApp.configure()
//
//        if let configuration = YMMYandexMetricaConfiguration(apiKey: AppConfig.yandexMetricaKey) {
//            YMMYandexMetrica.activate(with: configuration)
//        }
//
//        #if RELEASE
//        Settings.isAutoLogAppEventsEnabled = true
//        Settings.isAdvertiserIDCollectionEnabled = true
//        Analytics.setAnalyticsCollectionEnabled(true)
//        Crashlytics.crashlytics().setCrashlyticsCollectionEnabled(true)
//        #endif
    }
    
    func requestAuthorizePushNotifications(completion: @escaping (Bool, Error?) -> Void) {
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: completion)
        application.registerForRemoteNotifications()
//        Messaging.messaging().delegate = self
//
//        ApiClient.updateFirebasePushToken()
    }
}

extension AppContext: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
}

//extension AppContext: MessagingDelegate {
//    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
//        if Preferences.shared.authToken == nil { return }
//        debugPrint("✅ Firebase FCM token was updated: \(fcmToken)")
//        ApiClient.request(.updatePushToken(fcmToken), completion: { _ in })
//    }
//}
