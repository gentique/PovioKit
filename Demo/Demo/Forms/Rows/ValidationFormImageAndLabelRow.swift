//
//  ValidationFormImageAndLabelRow.swift
//  Regalo
//
//  Created by Nikola Angelkovik on 19.4.21.
//  Copyright © 2021 Povio Labs. All rights reserved.
//

import UIKit
import PovioKit

class ValidationFormImageAndLabelRow: TypedValidationFormRowType {
  var value: String?
  var imageName: String
  private let font: UIFont
  private let textColor: UIColor?

  init(
    label: String?,
    imageName: String,
    font: UIFont = .systemFont(ofSize: 16),
    textColor: UIColor? = .white
  ) {
    self.value = label
    self.imageName = imageName
    self.font = font
    self.textColor = textColor
  }

  func validationForm(_ validationForm: ValidationForm, cellForRowAt indexPath: IndexPath, in collectionView: UICollectionView) -> ValidationFormCell {
    let cell = collectionView.dequeueReusableCell(ValidationFormImageAndLabelCell.self, at: indexPath)
    cell.update(using: self)
    cell.font = font
    cell.textColor = textColor
    cell.imageName = imageName
    return cell
  }
}
