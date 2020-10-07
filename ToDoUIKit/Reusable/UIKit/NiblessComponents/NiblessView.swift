//
//  NiblessView.swift
//  TroopersIOS
//
//  Created by Voon Wei Liang on 24/07/2020.
//  Copyright © 2020 Voon Wei Liang. All rights reserved.
//

import UIKit

open class NiblessView: UIView {

  // MARK: - Methods
  public override init(frame: CGRect) {
    super.init(frame: frame)
  }

  @available(*, unavailable,
    message: "Loading this view from a nib is unsupported in favor of initializer dependency injection."
  )
  public required init?(coder aDecoder: NSCoder) {
    fatalError("Loading this view from a nib is unsupported in favor of initializer dependency injection.")
  }
}
