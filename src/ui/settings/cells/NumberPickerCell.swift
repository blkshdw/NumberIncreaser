//
//  NumberPickerCell.swift
//  NumberIncreaser
//
//  Created by Алексей on 28.01.2018.
//  Copyright © 2018 nubver. All rights reserved.
//

import Foundation
import UIKit
import EasyPeasy

/// A cell that contains input field with number pad
class NumberPickerCell: UITableViewCell {
  private let titleLabel = UILabel()
  private let inputField = UITextField()

  var beginEditingHandler: (() -> Void)? = nil
  var number: Int? {
    get {
      return inputField.text != nil ? Int(inputField.text!) : nil
    }
    set {
      inputField.text = newValue != nil ? "\(newValue!)" : ""
    }
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    inputField.isUserInteractionEnabled = selected
    self.titleLabel.textColor = selected ? UIColor.blue : .black
    if selected && !inputField.isFirstResponder {
      inputField.becomeFirstResponder()
    } else {
      inputField.resignFirstResponder()
    }
  }

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setup()
  }

  init(title: String, placeholder: String?) {
    super.init(style: .default, reuseIdentifier: nil)
    titleLabel.text = title
    inputField.placeholder = placeholder
    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setup() {
    contentView.addSubview(titleLabel)
    contentView.addSubview(inputField)

    inputField.delegate = self
    inputField.autocorrectionType = .no
    inputField.autocapitalizationType = .none
    inputField.keyboardType = .numberPad
    inputField.textAlignment = .right
    inputField.isUserInteractionEnabled = false

    titleLabel.easy.layout(
      LeftMargin(),
      CenterY()
    )

    inputField.easy.layout(
      RightMargin(),
      Left(2).to(titleLabel),
      CenterY()
    )
  }
}

extension NumberPickerCell: UITextFieldDelegate {
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    let allowedCharacters = CharacterSet.decimalDigits
    let characterSet = CharacterSet(charactersIn: string)
    return allowedCharacters.isSuperset(of: characterSet)
  }

  func textFieldDidBeginEditing(_ textField: UITextField) {
    beginEditingHandler?()
  }
  
}
