//
//  NumberScreenInteractor.swift
//  NumberIncreaser
//
//  Created by Алексей on 26.01.2018.
//  Copyright © 2018 nubver. All rights reserved.
//

import Foundation
import UIKit
import Dip

protocol NumberScreenInteractor: class {
  var view: NumberView! { get set }
  func refresh()
  func numberTapAction()
}

class DefaultNumberScreenInteractor: NumberScreenInteractor {
  var view: NumberView! {
    didSet {
      view.interactor = self
    }
  }

  private var numberManager: NumberManager!

  init(deps: DependencyContainer) {
    numberManager = try! deps.resolve()
  }

  func refresh() {
    view?.currentNumber = numberManager.currentNumber
  }

  func numberTapAction() {
    view?.currentNumber = numberManager.incNumber()
  }

}
