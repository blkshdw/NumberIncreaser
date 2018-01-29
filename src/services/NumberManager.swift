//
//  NumberManager.swift
//  NumberIncreaser
//
//  Created by Алексей on 26.01.2018.
//  Copyright © 2018 nubver. All rights reserved.
//

import Foundation
import Dip

protocol NumberManager: class {
  var currentNumber: Int { get set }
  var maxNumber: Int? { get set }
  var incSize: Int { get set }
  func incNumber() -> Int
  func save()
}

/// A class that manages current number that is displayed on "Number" screen and handles option change
class DefaultNumberManager: NumberManager {
  var storageHelper: StorageHelper!
  var currentNumber: Int = 0 {
    didSet {
      assert(currentNumber >= 0, "Current number should not be negative")
      guard let maxNumber = maxNumber, currentNumber >= maxNumber else { return }
      currentNumber = 0
    }
  }

  var maxNumber: Int? = nil {
    didSet {
      if let maxNumber = maxNumber, currentNumber > maxNumber {
        currentNumber = 0
        storageHelper.currentNumber = 0
      }
      storageHelper.maxNumber = maxNumber
    }
  }

  var incSize: Int = 1 {
    didSet {
      storageHelper.incSize = incSize
    }
  }

  /// Increments current number
  func incNumber() -> Int {
    currentNumber += incSize
    return currentNumber
  }

  func save() {
    storageHelper.currentNumber = currentNumber
  }

  init(deps: DependencyContainer) {
    storageHelper = try! deps.resolve()
    currentNumber = storageHelper.currentNumber
    incSize = storageHelper.incSize
    maxNumber = storageHelper.maxNumber
  }
}
