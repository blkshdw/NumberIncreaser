//
//  NumberScreenTestCase.swift
//  NumberIncreaserUITests
//
//  Created by Алексей on 29.01.2018.
//  Copyright © 2018 nubver. All rights reserved.
//

import XCTest
@testable import NumberIncreaser

class NumberScreenTestCase: XCTestCase {
  var app: XCUIApplication!
  let numberLabelIdentifier = Constants.accessIdentifiers.numberLabel

  override func setUp() {
    app = XCUIApplication()
    super.setUp()
    continueAfterFailure = false
    app .launch()
  }

  func testLabelExists() {
    let label = app.staticTexts.element(matching:.any, identifier: Constants.accessIdentifiers.numberLabel)
    XCTAssertTrue(label.exists, "Label exists")
  }

  func testTapLabel() {
    let label = app.staticTexts.element(matching:.any, identifier: Constants.accessIdentifiers.numberLabel)
    let value = "\(label.label)"
    label.tap()
    XCTAssertTrue(value != label.label, "Value changed after tap")
  }

}
