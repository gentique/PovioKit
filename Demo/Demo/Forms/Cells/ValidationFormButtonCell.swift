//
//  ValidationFormButtonCell.swift
//  Regalo
//
//  Created by Toni Kocjan on 24/09/2020.
//  Copyright © 2020 Povio Labs. All rights reserved.
//

import UIKit
import PovioKit
import SnapKit

class ValidationFormButtonCell: DynamicCollectionCell, ValidationFormCell {
  private let button = UIButton()
  var callback = VoidDelegate()
  
  var font: UIFont? {
    get { button.titleLabel?.font }
    set { button.titleLabel?.font = newValue }
  }
  var titleColor: UIColor? {
    get { button.titleColor(for: .normal) }
    set { button.setTitleColor(newValue, for: .normal) }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func prepareForReuse() { // swiftlint:disable:this overridden_super_call
    callback.delegate(to: self) { _ in }
  }
}

extension ValidationFormButtonCell {
  func update<R: TypedValidationFormRowType>(
    using row: R
  ) where R.Value: CustomStringConvertible {
    button.setTitle(row.value?.description, for: .normal)
  }
}

private extension ValidationFormButtonCell {
  func setupViews() {
    setupButton()
  }
  
  func setupButton() {
    contentView.addSubview(button)
    button.contentHorizontalAlignment = .right
    button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    button.snp.makeConstraints {
      $0.edges.equalToSuperview()
      $0.height.equalTo(15).priority(.high)
    }
  }
  
  @objc func didTapButton() {
    callback()
  }
}
