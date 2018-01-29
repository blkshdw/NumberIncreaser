//
//  NumberManagerTest.swift
//  NumberIncreaserTests
//
//  Created by Алексей on 28.01.2018.
//  Copyright © 2018 nubver. All rights reserved.
//

import XCTest
import Dip
@testable import NumberIncreaser

class NumberManagerTest: XCTestCase {

  func createMockContainer(maxNum: Int?, incSize: Int, currentNumber: Int = 0) -> DependencyContainer {
    return DependencyContainer { deps in
      deps.register(.singleton) { DefaultNumberManager(deps: deps) as NumberManager }
      deps.register(.singleton) { MockStorageHelper(maxNum: maxNum, incSize: incSize, currentNumber: currentNumber) as StorageHelper }
    }
  }

  func testIncWithoutOverflow() {
    let container = createMockContainer(maxNum: 80, incSize: 4, currentNumber: 1)
    let numberManager: NumberManager = try! container.resolve()
    _ = numberManager.incNumber()
    XCTAssertTrue(numberManager.currentNumber == 5, "Current number was increased by incSize, no overflow")
  }

  func testIncWithOverflow() {
    let container = createMockContainer(maxNum: 4, incSize: 80, currentNumber: 2)
    let numberManager: NumberManager = try! container.resolve()
    _ = numberManager.incNumber()
    XCTAssertTrue(numberManager.currentNumber == 0, "Current number was increased by incSize, overflowed and reseted to zero")
  }

  func testSetMaxNumberOverflow() {
    let container = createMockContainer(maxNum: 100, incSize: 2, currentNumber: 50)
    let numberManager: NumberManager = try! container.resolve()
    numberManager.maxNumber = 4
    XCTAssertTrue(numberManager.currentNumber == 0, "Max number was changed, current number overflowed and was reseted to zero")
  }

  func testSettingsChange() {
    let container = createMockContainer(maxNum: 3, incSize: 1, currentNumber: 2)
    let numberManager: NumberManager = try! container.resolve()
    numberManager.incSize = 2
    numberManager.maxNumber = nil
    let storageHelper: StorageHelper = try! container.resolve()
    XCTAssertTrue(numberManager.incSize == storageHelper.incSize && numberManager.maxNumber == storageHelper.maxNumber, "All options were saved to storageHelper")
  }

  func testCurrentNumberChange() {
    let container = createMockContainer(maxNum: 100, incSize: 1, currentNumber: 2)
    let numberManager: NumberManager = try! container.resolve()
    numberManager.currentNumber = 40
    numberManager.save()
    let storageHelper: StorageHelper = try! container.resolve()
    XCTAssertTrue(storageHelper.currentNumber == 40, "Current number was saved to storageHelper")
  }


}
