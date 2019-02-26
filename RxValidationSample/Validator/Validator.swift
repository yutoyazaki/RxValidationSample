//
//  Validator.swift
//  RxValidationSample
//
//  Created by Yuto Yazaki on 2019/02/26.
//  Copyright © 2019 Yuto Yazaki. All rights reserved.
//

import Foundation

protocol Validator {
  associatedtype ValueType
  associatedtype ErrorType: Error
  static func validate(_ value: ValueType) -> ValidationResult<ErrorType>
}

enum ValidationResult<E: Error> {
  case valid
  case invalid(E)

  var isValid: Bool {
    if case .valid = self {
      return true
    }
    return false
  }
}
