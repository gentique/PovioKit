//
//  ValidationFormLabelRow.swift
//  Regalo
//
//  Created by Toni Kocjan on 17/09/2020.
//  Copyright © 2020 Povio Labs. All rights reserved.
//

import UIKit
import PovioKit

class ValidationFormLabelRow: TypedValidationFormRowType {
  var value: String?
  private let font: UIFont
  private let textColor: UIColor?
  
  init(
    label: String?,
    font: UIFont = .systemFont(ofSize: 16),
    textColor: UIColor? = .white
  ) {
    self.value = label
    self.font = font
    self.textColor = textColor
  }
  
  func validationForm(_ validationForm: ValidationForm, cellForRowAt indexPath: IndexPath, in collectionView: UICollectionView) -> ValidationFormCell {
    let cell = collectionView.dequeueReusableCell(ValidationFormLabelCell.self, at: indexPath)
    cell.update(using: self)
    cell.font = font
    cell.textColor = textColor
    return cell
  }
}
