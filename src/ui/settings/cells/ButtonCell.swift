//
//  ButtonCell.swift
//  NumberIncreaser
//
//  Created by Алексей on 28.01.2018.
//  Copyright © 2018 nubver. All rights reserved.
//

import Foundation
import UIKit
import EasyPeasy

class ButtonCell: UITableViewCell {
  let titleLabel = UILabel()

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setup()
  }

  init(title: String) {
    super.init(style: .default, reuseIdentifier: nil)
    titleLabel.text = title
    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setup() {
    addSubview(titleLabel)
    titleLabel.textColor = UIColor.red
    titleLabel.textAlignment = .center

    titleLabel.easy.layout(
      CenterY(),
      Left(),
      Right()
    )

  }

}
