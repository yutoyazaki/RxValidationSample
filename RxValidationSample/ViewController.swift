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
  private let disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()
    let textView = UITextView()
    textView.rx.text
      .validate(NameValidator.self)
      .bind { result in
        dump(result)
      }
      .disposed(by: disposeBag)
  }
}
