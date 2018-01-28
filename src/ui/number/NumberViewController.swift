//
//  NumberViewController.swift
//  NumberIncreaser
//
//  Created by Алексей on 25.01.2018.
//  Copyright © 2018 nubver. All rights reserved.
//

import UIKit
import Dip
import EasyPeasy

protocol NumberView: class {
  var interactor: NumberScreenInteractor? { get set }
  var currentNumber: Int? { get set }

}

class NumberViewController: UIViewController, NumberView {
  var interactor: NumberScreenInteractor? = nil
  let numberLabel = UILabel()

  var currentNumber: Int? {
    get  {
      return Int(numberLabel.text ?? "")
    }
    set {
      numberLabel.text = "\(newValue ?? 0)"
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    title = navigationController?.title
    setupView()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    interactor?.refresh()
  }

  func setupView() {
    numberLabel.font = UIFont.systemFont(ofSize: 100)
    numberLabel.isUserInteractionEnabled = true
    numberLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(numberTapped)))
    view.addSubview(numberLabel)
    numberLabel.adjustsFontSizeToFitWidth = true
    numberLabel.textAlignment = .center
    numberLabel.easy.layout(
      Left(),
      Right(),
      CenterY()
    )
    view.backgroundColor = .white
  }

  @objc func numberTapped() {
    interactor?.numberTapAction()
  }


  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}
