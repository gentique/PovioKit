//
//  File.swift
//  Regalo
//
//  Created by Toni Kocjan on 24/09/2020.
//  Copyright © 2020 Povio Labs. All rights reserved.
//

import UIKit
import PovioKit

class ValidationFormButtonRow: TypedValidationFormRowType {
  var value: String?
  private let font: UIFont
  private let titleColor: UIColor?
  private let callback: () -> Void
  
  init(
    label: String?,
    font: UIFont = .systemFont(ofSize: 12),
    titleColor: UIColor? = UIColor.white.withAlphaComponent(0.5),
    callback: @escaping () -> Void
  ) {
    self.value = label
    self.font = font
    self.titleColor = titleColor
    self.callback = callback
  }
  
  func validationForm(_ validationForm: ValidationForm, cellForRowAt indexPath: IndexPath, in collectionView: UICollectionView) -> ValidationFormCell {
    let cell = collectionView.dequeueReusableCell(ValidationFormButtonCell.self, at: indexPath)
    cell.update(using: self)
    cell.font = font
    cell.titleColor = titleColor
    cell.callback.delegate(to: self) { (self, _) in  // swiftlint:disable:this unneeded_parentheses_in_closure_argument
      self?.callback()
    }
    return cell
  }
}
