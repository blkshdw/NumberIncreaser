//
//  RootViewController.swift
//  NumberIncreaser
//
//  Created by Алексей on 26.01.2018.
//  Copyright © 2018 nubver. All rights reserved.
//

import Foundation
import UIKit
import Dip

/// Root Screeen
class RootViewController: UITabBarController {

  init(deps: DependencyContainer) {
    super.init(nibName: nil, bundle: nil)
    let settingsViewController = try! deps.resolve() as SettingsViewController
    let numberViewController = try! deps.resolve() as NumberViewController

    let settingsViewInteractor: SettingsScreenInteractor = try! deps.resolve()
    let numberScreenInteractor: NumberScreenInteractor = try! deps.resolve()

    settingsViewInteractor.view = settingsViewController
    numberScreenInteractor.view = numberViewController

    let settingsNavigationController = UINavigationController(rootViewController: settingsViewController)
    settingsNavigationController.title = Constants.settings
    let numberNavigationController = UINavigationController(rootViewController: numberViewController)
    numberNavigationController.title = Constants.number

    self.setViewControllers([numberNavigationController, settingsNavigationController], animated: false)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
