//
//  SettingsScreen.swift
//  NumberIncreaser
//
//  Created by Алексей on 27.01.2018.
//  Copyright © 2018 nubver. All rights reserved.
//

import Foundation
import UIKit
import Dip

enum SettingsScreen {

  static func configure(overrideConfig: ((DependencyContainer) -> Void)? = nil) -> DependencyContainer {
    return DependencyContainer { deps in
      deps.register { DefaultSettingsScreenInteractor(deps: deps) as SettingsScreenInteractor }
      deps.register { SettingsViewController(style: .grouped) }
      overrideConfig?(deps)
    }
  }

}

