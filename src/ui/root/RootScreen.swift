//
//  RootScreen.swift
//  NumberIncreaser
//
//  Created by Алексей on 28.01.2018.
//  Copyright © 2018 nubver. All rights reserved.
//

import Foundation
import UIKit
import Dip

enum RootScreen {

  static func configure(overrideConfig: ((DependencyContainer) -> Void)? = nil) -> DependencyContainer {
    return DependencyContainer { deps in
      deps.register { RootViewController() as RootView }
      overrideConfig?(deps)
    }
  }
  
}

