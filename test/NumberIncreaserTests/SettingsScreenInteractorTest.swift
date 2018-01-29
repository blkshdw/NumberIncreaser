//
//  SettingsScreenInteractorTest.swift
//  NumberIncreaserTests
//
//  Created by Алексей on 29.01.2018.
//  Copyright © 2018 nubver. All rights reserved.
//

import XCTest
import Dip
@testable import NumberIncreaser

class SettingsScreenInteractorTest: XCTestCase {
  class MockSettingsView: SettingsView {
    var interactor: SettingsScreenInteractor?

    var maxNumber: Int? = 0
    var incSize: Int? = 0
    
    func setValues(maxNumber: Int?, incSize: Int?) {
      self.maxNumber = maxNumber
      self.incSize = incSize
    }
  }

  var mockContainer: DependencyContainer {
    return DependencyContainer { deps in
      deps.register(.singleton) { DefaultNumberManager(deps: deps) as NumberManager }
      deps.register(.singleton) { MockStorageHelper(maxNum: 10, incSize: 1, currentNumber: 0) as StorageHelper }
      deps.register() { DefaultSettingsScreenInteractor(deps: deps) as SettingsScreenInteractor }
      deps.register() { MockSettingsView() as SettingsView }
    }
  }

  func testSetValues() {
    let view: SettingsView = try! mockContainer.resolve()
    let interactor: SettingsScreenInteractor = try! mockContainer.resolve()
    interactor.view = view
    interactor.saveValues(maxNumber: 3, incSize: 2)
    let mockView = view as! MockSettingsView
    XCTAssertTrue(mockView.maxNumber == 3 && mockView.incSize == 2, "Interactor called setValues method of SettingsView")
  }

}
