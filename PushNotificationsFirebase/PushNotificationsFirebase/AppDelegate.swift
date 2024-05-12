//
//  AppDelegate.swift
//  PushNotificationsFirebase
//
//  Created by Xotech on 12/05/2024.
//

import UIKit
import FirebaseCore
import FirebaseMessaging


@main
class AppDelegate: UIResponder, UIApplicationDelegate{

    let gcmMessageIDKey = "gcm.MessageIDKey"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        self.configurePushNotifications()
        
        
        return true
    }
    
    func configurePushNotifications(){
        
        FirebaseApp.configure()
        
    
        UNUserNotificationCenter.current().delegate = self
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
          options: authOptions,
          completionHandler: { _, _ in }
        )
        UIApplication.shared.registerForRemoteNotifications()
        Messaging.messaging().delegate = self
        
    }


    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
    
    
}



extension AppDelegate: UNUserNotificationCenterDelegate {
 
  func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
    let userInfo = notification.request.content.userInfo
    print(userInfo)
    return [[.alert, .sound]]
  }
  func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
    let userInfo = response.notification.request.content.userInfo
    print(userInfo)
  }
}


extension AppDelegate: MessagingDelegate {
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
      print("Firebase registration token: \(String(describing: fcmToken))")
      
      let dataDict: [String: String] = ["token": fcmToken ?? ""]
      NotificationCenter.default.post(
        name: Notification.Name("FCMToken"),
        object: nil,
        userInfo: dataDict
      )
        
    }
    
}
