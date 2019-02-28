//
//  ValidationResult.swift
//  RxValidationSample
//
//  Created by Yuto Yazaki on 2019/02/26.
//  Copyright © 2019 Yuto Yazaki. All rights reserved.
//

import Foundation

enum ValidationResult<E: Error> {
  case valid
  case invalid(E)

  var isValid: Bool {
    if case .valid = self {
      return true
    }
    return false
  }

  var errorDescription: String? {
    if case let .invalid(error) = self {
      return error.localizedDescription
    }
    return nil
  }
}
