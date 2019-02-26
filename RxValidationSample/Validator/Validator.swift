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

enum NameValidator: Validator {
  typealias ValueType = String?
  typealias ErrorType = NameValidationError

  static func validate(_ value: String?) -> ValidationResult<NameValidationError> {
    guard let value = value, !value.isEmpty else { return .invalid(.empty) }
    if value.count > 30 {
      return .invalid(.tooLong)
    }
    return .valid
  }
}
