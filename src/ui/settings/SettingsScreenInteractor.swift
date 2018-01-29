//
//  SettingsScreenInteractor.swift
//  NumberIncreaser
//
//  Created by Алексей on 27.01.2018.
//  Copyright © 2018 nubver. All rights reserved.
//

import Foundation
import UIKit
import Dip

protocol SettingsScreenInteractor: class {
  var view: SettingsView! { get set }
  /// Sets current number to zero
  func reset()
  
  /// A function that saves maxNumber and incSize
  /// - Parameter maxNumber: maximum possible value
  /// - Parameter incSize: a value that current number is incremented on each tap
  func saveValues(maxNumber: Int?, incSize: Int?) 
}

class DefaultSettingsScreenInteractor: SettingsScreenInteractor {
  var view: SettingsView! {
    didSet {
      view.interactor = self
      view.setValues(maxNumber: numberManager.maxNumber, incSize: numberManager.incSize)
    }
  }
  
  var numberManager: NumberManager!

  init(deps: DependencyContainer) {
    self.numberManager = try! deps.resolve()
  }

  func saveValues(maxNumber: Int? = nil, incSize: Int? = nil) {
    numberManager.maxNumber = maxNumber
    numberManager.incSize = incSize ?? 1
    numberManager.save()
    view.setValues(maxNumber: numberManager.maxNumber, incSize: numberManager.incSize)
  }

  func reset() {
    numberManager.currentNumber = 0
  }

}
