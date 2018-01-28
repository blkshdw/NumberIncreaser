//
//  StorageHelper.swift
//  NumberIncreaser
//
//  Created by Алексей on 28.01.2018.
//  Copyright © 2018 nubver. All rights reserved.
//

import Foundation
import UIKit

class StorageHelper {
  enum StorageKey: String {
    case currentNumber
    case incSize
    case maxNumber
  }

  func save(_ object: Any?, forKey key: StorageKey) {
    let userDefaults = UserDefaults.standard
    userDefaults.set(object, forKey: key.rawValue)
  }

  func loadObjectForKey<T>(_ key: StorageKey) -> T? {
    let userDefaults = UserDefaults.standard
    let object = userDefaults.object(forKey: key.rawValue)
    return object as? T
  }

}


