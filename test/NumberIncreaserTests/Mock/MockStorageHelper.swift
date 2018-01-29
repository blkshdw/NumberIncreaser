//
//  MockStorageHelper.swift
//  NumberIncreaser
//
//  Created by Алексей on 29.01.2018.
//  Copyright © 2018 nubver. All rights reserved.
//

import Foundation
@testable import NumberIncreaser

class MockStorageHelper: StorageHelper {
  var maxNumber: Int? = 80
  var incSize: Int = 4
  var currentNumber: Int = 1

  init(maxNum: Int?, incSize: Int, currentNumber: Int = 0) {
    self.maxNumber = maxNum
    self.incSize = incSize
    self.currentNumber = currentNumber
  }
}
