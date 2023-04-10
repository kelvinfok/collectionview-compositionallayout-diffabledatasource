//
//  FooterView.swift
//  comp-layout-demo
//
//  Created by Kelvin Fok on 11/4/23.
//

import UIKit

class FooterView: UICollectionReusableView {
  static let identifier = "FooterView"

  private let activityIndicator = UIActivityIndicatorView()

  override init(frame: CGRect) {
    super.init(frame: frame)
    layout()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func layout() {
    addSubview(activityIndicator)
    activityIndicator.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }
    activityIndicator.hidesWhenStopped = true
  }

  func toggleLoading(isEnabled: Bool) {
    if isEnabled {
      activityIndicator.startAnimating()
    } else {
      activityIndicator.stopAnimating()
    }
  }
}
