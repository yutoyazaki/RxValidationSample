//
//  ValidateRule.swift
//  RxValidationSample
//
//  Created by Yuto Yazaki on 2019/02/26.
//  Copyright © 2019 Yuto Yazaki. All rights reserved.
//

import Foundation

enum NameValidator: Validator {
  typealias ValueType = String?
  typealias ErrorType = Error

  enum Error: LocalizedError {
    case empty
    case tooLong

    var errorDescription: String? {
      switch self {
      case .empty:
        return ""
      case .tooLong:
        return ""
      }
    }
  }

  static func validate(_ value: String?) -> ValidationResult<NameValidator.Error> {
    guard let value = value, value.isEmpty else { return .invalid(.empty) }
    if value.count >= 30 {
      return .invalid(.tooLong)
    }
    return .valid
  }
}
