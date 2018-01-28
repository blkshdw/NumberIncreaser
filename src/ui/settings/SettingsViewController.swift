//
//  SettingsViewController.swift
//  NumberIncreaser
//
//  Created by Алексей on 25.01.2018.
//  Copyright © 2018 nubver. All rights reserved.
//

import UIKit
import EasyPeasy

protocol SettingsView: class {
  var interactor: SettingsScreenInteractor? { get set }

  func setValues(maxNumber: Int?, incSize: Int?)
}

private enum SettingsCellType: Int {
  case maxNumber
  case incSize
  case reset

  var title: String {
    switch self {
    case .maxNumber:
      return Constants.maxNumberCellLabel
    case .incSize:
      return Constants.incSizeCellLabel
    case .reset:
      return Constants.reset
    }
  }

  var description: String? {
    switch self {
    case .maxNumber:
      return Constants.none
    case .incSize:
      return nil
    case .reset:
      return nil
    }
  }
}

class SettingsViewController: UITableViewController, SettingsView {
  var interactor: SettingsScreenInteractor?

  func setValues(maxNumber: Int?, incSize: Int?) {
    maxNumberPickerCell.number = maxNumber
    incrementSizeCell.number = incSize
  }

  private let maxNumberPickerCell = NumberPickerCell(title: SettingsCellType.maxNumber.title, placeholder: SettingsCellType.maxNumber.description)
  private let incrementSizeCell = NumberPickerCell(title: SettingsCellType.incSize.title, placeholder: SettingsCellType.incSize.description)
  private let buttonCell = ButtonCell(title: Constants.reset)

  private var cells: [UITableViewCell] {
    return [maxNumberPickerCell, incrementSizeCell, buttonCell]
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    title = navigationController?.title
    setupView()
    setupHandlers()
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: Constants.save, style: .done, target: self, action: #selector(saveValues))
    navigationItem.rightBarButtonItem?.isEnabled = false
  }

  @objc func saveValues() {
    interactor?.setValues(maxNumber: maxNumberPickerCell.number, incSize: incrementSizeCell.number)
    if let selectedPath = tableView.indexPathForSelectedRow {
      tableView.deselectRow(at: selectedPath, animated: true)
    }
    navigationItem.rightBarButtonItem?.isEnabled = false
  }

  private func setupView() {
    view.backgroundColor = .white
    tableView.keyboardDismissMode = .onDrag
  }

  private func setupHandlers() {
    for cell in [maxNumberPickerCell, incrementSizeCell] {
      cell.beginEditingHandler = { [unowned self] in
        self.navigationItem.rightBarButtonItem?.isEnabled = true
      }
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return cells[indexPath.section]
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let cellType = SettingsCellType(rawValue: indexPath.section) else { return }
    switch cellType {
    case .reset:
      self.maxNumberPickerCell.isSelected = false
      self.incrementSizeCell.isSelected = false
      interactor?.reset()
      tableView.deselectRow(at: indexPath, animated: true)
    default:
      break
    }
  }

  override func numberOfSections(in tableView: UITableView) -> Int {
    return cells.count
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    guard let cellType = SettingsCellType(rawValue: section) else { return nil }
    return cellType.title
  }

}

