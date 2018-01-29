//
//  AppDelegate.swift
//  NumberIncreaser
//
//  Created by Алексей on 25.01.2018.
//  Copyright © 2018 nubver. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  let deps = AppContainer.configure()
  var numberManager: NumberManager!
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    self.window = UIWindow()
    self.numberManager = try! deps.resolve()
    let rootViewController: RootViewController = try! deps.resolve()
    window?.rootViewController = rootViewController
    window?.makeKeyAndVisible()

    return true
  }

  func applicationWillTerminate(_ application: UIApplication) {
    numberManager.save()
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    numberManager.save()
  }
}

