//
//  NumberStory.swift
//  NumberIncreaser
//
//  Created by Алексей on 26.01.2018.
//  Copyright © 2018 nubver. All rights reserved.
//

import Foundation
import Dip

enum NumberScreen {

  static func configure(overrideConfig: ((DependencyContainer) -> Void)? = nil) -> DependencyContainer {
    return DependencyContainer { deps in
      deps.register { DefaultNumberScreenInteractor(deps: deps) as NumberScreenInteractor }
      deps.register { NumberViewController() }
      overrideConfig?(deps)
    }
  }

}

