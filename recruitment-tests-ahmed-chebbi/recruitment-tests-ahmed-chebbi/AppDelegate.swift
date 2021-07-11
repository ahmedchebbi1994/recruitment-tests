//
//  AppDelegate.swift
//  recruitment-tests-ahmed-chebbi
//
//  Created by Chebbi on 11/07/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var appCoordinator: AppCoordinator?
        
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        appCoordinator = AppCoordinator(window: UIWindow())
        appCoordinator?.start()
        return true
    }

}

