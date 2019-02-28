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

enum NameValidationError: LocalizedError {
  case empty
  case tooLong

  var errorDescription: String? {
    switch self {
    case .empty:
      return "名前は必須項目です。"
    case .tooLong:
      return "名前は20文字以内で入力してください。"
    }
  }
}

enum NameValidator: Validator {
  typealias ValueType = String?
  typealias ErrorType = NameValidationError

  static func validate(_ value: String?) -> ValidationResult<NameValidationError> {
    // 空文字は許容しない
    guard let value = value, !value.isEmpty else { return .invalid(.empty) }

    // ユーザ名は20文字以内でなければいけない
    if value.count > 20 {
      return .invalid(.tooLong)
    }
    return .valid
  }
}
