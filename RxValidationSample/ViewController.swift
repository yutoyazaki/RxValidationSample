//
//  ViewController.swift
//  RxValidationSample
//
//  Created by Yuto Yazaki on 2019/02/26.
//  Copyright © 2019 Yuto Yazaki. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

  @IBOutlet private weak var textField: UITextField!
  @IBOutlet private weak var resultLabel: UILabel!
  private let disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()
    bind()
  }

  private func bind() {
    textField.rx.text
      .validate(NameValidator.self)
      .map { result -> String? in
        result.errorDescription
      }
      .bind(to: resultLabel.rx.text)
      .disposed(by: disposeBag)
  }
}
