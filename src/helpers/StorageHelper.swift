//
//  StorageHelper.swift
//  NumberIncreaser
//
//  Created by Алексей on 28.01.2018.
//  Copyright © 2018 nubver. All rights reserved.
//

import Foundation
import UIKit

/// Manages current number, maximum number and increment number values
protocol StorageHelper: class {
  var maxNumber: Int? { get set }
  var incSize: Int { get set }
  var currentNumber: Int { get set }
}

class DefaultStorageHelper: StorageHelper {
  enum StorageKey: String {
    case currentNumber
    case incSize
    case maxNumber
  }

  var maxNumber: Int? {
    get {
      return loadObjectForKey(.maxNumber)
    }
    set {
      save(newValue, forKey: .maxNumber)
    }
  }

  var incSize: Int {
    get {
      return loadObjectForKey(.incSize) ?? 1

    }
    set {
      save(newValue, forKey: .incSize)
    }
  }

  var currentNumber: Int {
    get {
      return loadObjectForKey(.currentNumber) ?? 0
    }
    set {
      save(newValue, forKey: .currentNumber)
    }
  }

  private func save(_ object: Any?, forKey key: StorageKey) {
    let userDefaults = UserDefaults.standard
    userDefaults.set(object, forKey: key.rawValue)
  }

  private func loadObjectForKey<T>(_ key: StorageKey) -> T? {
    let userDefaults = UserDefaults.standard
    let object = userDefaults.object(forKey: key.rawValue)
    return object as? T
  }

}
