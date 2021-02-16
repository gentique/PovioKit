//
//  ValidationStatus.swift
//  PovioKit
//
//  Created by Toni Kocjan on 08/08/2019.
//  Copyright © 2019 Povio Labs. All rights reserved.
//

import Foundation

public enum ValidationStatus: ValidationStatusConforming {
  case valid(_: ())
  case invalid(_ errorMessage: String)
  case pending(_: ())
}

public extension ValidationStatus {
  var isValid: Bool {
    switch self {
    case .valid:
      return true
    case .invalid, .pending:
      return false
    }
  }
  
  var isInvalid: Bool {
    switch self {
    case .invalid:
      return true
    case .pending, .valid:
      return false
    }
  }
  
  var isPending: Bool {
    switch self {
    case .pending:
      return true
    case .invalid, .valid:
      return false
    }
  }
}
