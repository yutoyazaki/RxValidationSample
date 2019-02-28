//
//  ObservableType+Validator.swift
//  RxValidationSample
//
//  Created by Yuto Yazaki on 2019/02/26.
//  Copyright © 2019 Yuto Yazaki. All rights reserved.
//

import Foundation
import RxSwift

extension ObservableType {
  func validate<V: Validator>(_ validator: V.Type)
    -> Observable<ValidationResult<V.ErrorType>> where V.ValueType == Self.E {
      return map { validator.validate($0) }
  }
}
