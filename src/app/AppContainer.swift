//
//  AppContainer.swift
//  NumberIncreaser
//
//  Created by Алексей on 26.01.2018.
//  Copyright © 2018 nubver. All rights reserved.
//

import Foundation
import Dip

enum AppContainer {

  static func configure(overrideConfig: ((DependencyContainer) -> Void)? = nil) -> DependencyContainer {
    return DependencyContainer { deps in

      deps.register(.singleton) { DefaultNumberManager(deps: deps) as NumberManager }
      deps.register(.singleton) { StorageHelper() }
      deps.register(.singleton) { RootViewController() }

      deps.collaborate(with: SettingsScreen.configure())
      deps.collaborate(with: NumberScreen.configure())

      overrideConfig?(deps)
    }
  }

}
