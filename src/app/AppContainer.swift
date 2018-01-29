//
//  AppContainer.swift
//  NumberIncreaser
//
//  Created by Алексей on 26.01.2018.
//  Copyright © 2018 nubver. All rights reserved.
//

import Foundation
import Dip

/// Default application container
enum AppContainer {

  static func configure(overrideConfig: ((DependencyContainer) -> Void)? = nil) -> DependencyContainer {
    return DependencyContainer { deps in

      deps.register(.singleton) { DefaultNumberManager(deps: deps) as NumberManager }
      deps.register(.singleton) { DefaultStorageHelper() as StorageHelper }
      deps.register() { RootViewController(deps: deps) }

      deps.collaborate(with: SettingsScreen.configure())
      deps.collaborate(with: NumberScreen.configure())

      overrideConfig?(deps)
    }
  }

}
