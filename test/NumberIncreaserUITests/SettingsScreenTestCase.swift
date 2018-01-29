//
//  SettingsScreenTestCase.swift
//  NumberIncreaserUITests
//
//  Created by Алексей on 29.01.2018.
//  Copyright © 2018 nubver. All rights reserved.
//

import XCTest
@testable import NumberIncreaser

class SettingsScreenTestCase: XCTestCase {
  var app: XCUIApplication!

  override func setUp() {
    app = XCUIApplication()

    super.setUp()
    continueAfterFailure = false
    app.launch()
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

  func testSettingsScreenVisible() {
    let tabBarsQuery = app.tabBars
    tabBarsQuery.buttons[Constants.settings].tap()
    XCTAssertTrue(app.tables[Constants.accessIdentifiers.settingsTable].exists, "Settings table exists")
  }

}
