//
//  NumberScreenInteractorTest.swift
//  NumberIncreaserUITests
//
//  Created by Алексей on 29.01.2018.
//  Copyright © 2018 nubver. All rights reserved.
//

import XCTest
import Dip
@testable import NumberIncreaser

class NumberScreenInteractorTest: XCTestCase {

  class MockNumberView: NumberView {
    var interactor: NumberScreenInteractor? = nil
    var currentNumber: Int? = nil
  }

  var mockContainer: DependencyContainer {
    return DependencyContainer { deps in
      deps.register(.singleton) { DefaultNumberManager(deps: deps) as NumberManager }
      deps.register(.singleton) { MockStorageHelper(maxNum: 10, incSize: 1, currentNumber: 0) as StorageHelper }
      deps.register() { DefaultNumberScreenInteractor(deps: deps) as NumberScreenInteractor }
      deps.register() { MockNumberView() as NumberView }
    }
  }

  func testTap() {
    let view: NumberView = try! mockContainer.resolve()
    let interactor: NumberScreenInteractor = try! mockContainer.resolve()
    interactor.view = view
    interactor.numberTapAction()
    XCTAssertTrue(view.currentNumber == 1, "Number increased on tap")
  }

}
