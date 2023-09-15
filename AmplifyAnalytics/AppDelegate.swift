//
//  AppDelegate.swift
//  AmplifyAnalytics
//
//  Created by David Perez Espino on 15/09/23.
//

import UIKit
import Amplify
import AWSCognitoAuthPlugin
import AWSPinpointAnalyticsPlugin
import AWSCloudWatchLoggingPlugin

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        do {
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.add(plugin: AWSPinpointAnalyticsPlugin())
            
            let loggingConfiguration = AWSCloudWatchLoggingPluginConfiguration(logGroupName: "AmplifyAnalytics", region: "us-east-2", localStoreMaxSizeInMB: 1, flushIntervalInSeconds: 60)
            let loggingPlugin = AWSCloudWatchLoggingPlugin(loggingPluginConfiguration: loggingConfiguration)
            
            try Amplify.add(plugin: loggingPlugin)
            try Amplify.configure()
            print("Amplify configured with Auth, Analytics amd CloudWatch plugins")
        } catch {
            print("Failed to initialize Amplify with \(error)")
        }
        
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

