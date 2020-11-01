//
//  AppDelegate.swift
//  Towards14
//
//  Created by 林 大地 on 2020/10/21.
//  Copyright © 2020 林 大地. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        // NavigationBar の backButtonTitle を消す
        // NOTE: 消したい VC の self.title, self.navigationItem.backButtonTitle = ""
        //       としても実現できるが、 iOS 14 では backButton 長押しでタイトルが付くようになったので、それに対応している。
        //       具体的には、 UIColor.clear を当てることでタイトルを透過させている。
        // SEE: https://sarunw.com/posts/what-should-you-know-about-navigation-history-stack-in-ios14/
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()

        appearance.backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

