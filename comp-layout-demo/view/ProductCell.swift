//
//  ProductCell.swift
//  comp-layout-demo
//
//  Created by Kelvin Fok on 11/4/23.
//

import UIKit

class ProductCell: UICollectionViewCell {
  static let identifier = "GridCell"

  private let placeholderImage = UIImage(systemName: "photo.fill")?
    .withTintColor(.systemGray6, renderingMode: .alwaysOriginal)

  private let label: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    return label
  }()

  private lazy var productImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.image = placeholderImage
    return imageView
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    layout()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func layout() {
    contentView.layer.borderColor = UIColor.systemBackground.cgColor
    contentView.layer.borderWidth = 1

    [label, productImageView].forEach {
      contentView.addSubview($0)
    }

    productImageView.snp.makeConstraints { make in
      make.leading.top.trailing.equalToSuperview()
      make.bottom.equalToSuperview().offset(-24)
    }

    label.snp.makeConstraints { make in
      make.leading.bottom.trailing.equalToSuperview()
      make.top.equalTo(productImageView.snp.bottom)
    }
  }

  func configure(item: Product) {
    label.text = item.name
    productImageView.sd_setImage(
      with: URL(string: item.imageURL),
      placeholderImage: placeholderImage)
  }
}
