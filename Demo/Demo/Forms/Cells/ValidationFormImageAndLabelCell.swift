//
//  ValidationFormImageAndLabelCell.swift
//  Regalo
//
//  Created by Nikola Angelkovik on 19.4.21.
//  Copyright © 2021 Povio Labs. All rights reserved.
//

import UIKit
import PovioKit

class ValidationFormImageAndLabelCell: DynamicCollectionCell, ValidationFormCell {
  private var imageView = UIImageView()
  private let label = UILabel()

  var font: UIFont {
    get { label.font }
    set { label.font = newValue }
  }
  var textColor: UIColor? {
    get { label.textColor }
    set { label.textColor = newValue }
  }

  var imageName: String? {
    didSet {
      guard let imageName = imageName else { return }
      imageView.image = UIImage(named: imageName)
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension ValidationFormImageAndLabelCell {
  func update<R: TypedValidationFormRowType>(
    using row: R
  ) where R.Value: CustomStringConvertible {
    label.text = row.value?.description
  }
}

private extension ValidationFormImageAndLabelCell {
  func setupViews() {
    setupLabel()
    setupImageView()
  }

  func setupLabel() {
    contentView.addSubview(label)
    label.numberOfLines = 0
    label.snp.makeConstraints {
      $0.trailing.equalToSuperview()
      $0.top.bottom.equalToSuperview().offset(10)
    }
  }

  func setupImageView() {
    contentView.addSubview(imageView)
    imageView.snp.makeConstraints {
      $0.leading.equalToSuperview()
      $0.trailing.equalTo(label.snp.leading).offset(-10)
      $0.centerY.equalTo(label)
      $0.size.equalTo(22)
    }
  }
}
