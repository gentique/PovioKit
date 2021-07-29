//
//  ValidationFormLabelCell.swift
//  Regalo
//
//  Created by Toni Kocjan on 17/09/2020.
//  Copyright © 2020 Povio Labs. All rights reserved.
//

import UIKit
import PovioKit

class ValidationFormLabelCell: DynamicCollectionCell, ValidationFormCell {
  private let label = UILabel()
  
  var font: UIFont {
    get { label.font }
    set { label.font = newValue }
  }
  var textColor: UIColor? {
    get { label.textColor }
    set { label.textColor = newValue }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension ValidationFormLabelCell {
  func update<R: TypedValidationFormRowType>(
    using row: R
  ) where R.Value: CustomStringConvertible {
    label.text = row.value?.description
  }
}

private extension ValidationFormLabelCell {
  func setupViews() {
    setupLabel()
  }
  
  func setupLabel() {
    contentView.addSubview(label)
    label.numberOfLines = 0
    label.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}
