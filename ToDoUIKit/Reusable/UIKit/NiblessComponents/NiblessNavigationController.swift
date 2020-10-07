//
//  NiblessNavigationController.swift
//  TroopersIOS
//
//  Created by Voon Wei Liang on 28/07/2020.
//  Copyright © 2020 Voon Wei Liang. All rights reserved.
//

import UIKit

open class NiblessNavigationController: UINavigationController {

  // MARK: - Methods
  public init() {
    super.init(nibName: nil, bundle: nil)
  }

  @available(*, unavailable,
    message: "Loading this view controller from a nib is unsupported in favor of initializer dependency injection."
  )
  public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }

  @available(*, unavailable,
    message: "Loading this view controller from a nib is unsupported in favor of initializer dependency injection."
  )
  public required init?(coder aDecoder: NSCoder) {
    fatalError("Loading this view controller from a nib is unsupported in favor of initializer dependency injection.")
  }
}
